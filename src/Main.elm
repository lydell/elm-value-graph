module Main exposing (main)

import Browser
import Dict exposing (Dict)
import Fixture
import Graph exposing (Edge, Graph, Node, NodeId)
import Graph.DOT
import Html exposing (Html)
import Html.Attributes
import Html.Events
import Regex exposing (Regex)
import Set exposing (Set)


main : Program () Model Msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


type alias Model =
    { page : Page
    }


type Page
    = Textarea
    | Graph GraphData


type alias GraphData =
    { code : String
    , search : String
    }


init : () -> ( Model, Cmd Msg )
init () =
    ( { page =
            Graph
                { code = Fixture.fixture
                , search = ""
                }
      }
    , Cmd.none
    )


type Msg
    = TextareaChanged String
    | BackToTextareaPressed
    | SearchChanged String


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        TextareaChanged code ->
            ( { model
                | page =
                    Graph
                        { code = code
                        , search = ""
                        }
              }
            , Cmd.none
            )

        BackToTextareaPressed ->
            ( { model | page = Textarea }, Cmd.none )

        SearchChanged text ->
            case model.page of
                Textarea ->
                    ( model, Cmd.none )

                Graph data ->
                    ( { model | page = Graph { data | search = text } }, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none


view : Model -> Html Msg
view model =
    case model.page of
        Textarea ->
            viewContainer
                { toolbar = []
                , content = viewTextarea
                }

        Graph { code, search } ->
            let
                functions =
                    parseEntrypoints code
                        |> List.foldl prune (parse code)

                parsedSearch =
                    parseSearch search

                matches =
                    functions
                        |> Dict.keys
                        |> List.filter (matchFunction parsedSearch)

                inverted =
                    invert functions

                functionsToKeep =
                    matches
                        |> List.foldl
                            (referencing inverted >> Set.union)
                            (Set.fromList matches)

                filtered =
                    functions
                        |> Dict.filter (\name _ -> Set.member name functionsToKeep)

                suggestions =
                    functions
                        |> Dict.keys
                        |> List.concatMap
                            (\functionName ->
                                case parseFunctionName functionName of
                                    App { name } ->
                                        [ String.join "." name ]

                                    Package { author, package, name } ->
                                        [ author ++ "/" ++ package
                                        , String.join "." name
                                        ]

                                    Unknown name ->
                                        [ name ]
                            )
                        -- Remove duplicates
                        |> Set.fromList
                        |> Set.toList
                        |> List.sort
            in
            viewContainer
                { toolbar = viewGraphToolbar search suggestions
                , content =
                    if Dict.isEmpty filtered then
                        Html.text "empty"

                    else if Dict.size filtered > 1000 then
                        Html.text <| "Graph too big: " ++ String.fromInt (Dict.size filtered)

                    else
                        viewGraph filtered
                }


viewContainer : { toolbar : List (Html msg), content : Html msg } -> Html msg
viewContainer { toolbar, content } =
    Html.div [ Html.Attributes.class "Container AbsoluteFill" ]
        [ Html.div [ Html.Attributes.class "Container-toolbar" ]
            (Html.text "Find references to an Elm value “recursively”"
                :: toolbar
            )
        , Html.div [ Html.Attributes.class "Container-content" ]
            [ content
            ]
        ]


searchFieldId : String
searchFieldId =
    "searchFieldId"


viewGraphToolbar : String -> List String -> List (Html Msg)
viewGraphToolbar search suggestions =
    [ Html.label [ Html.Attributes.class "SearchField" ]
        [ Html.span [ Html.Attributes.class "SearchField-label" ]
            [ Html.text "Search (Fully.Qualified.name or author/package)" ]
        , Html.input
            [ Html.Attributes.value search
            , Html.Events.onInput SearchChanged
            , Html.Attributes.placeholder "For example “Html.Styled.toUnstyled” or “rtfeldman/elm-css”"
            , Html.Attributes.style "width" "30em"
            , Html.Attributes.list searchFieldId
            ]
            []
        , Html.datalist [ Html.Attributes.id searchFieldId ]
            (suggestions
                |> List.map
                    (\suggestion ->
                        Html.option [ Html.Attributes.value suggestion ] []
                    )
            )
        ]
    , Html.button
        [ Html.Attributes.style "margin-left" "auto"
        , Html.Events.onClick BackToTextareaPressed
        ]
        [ Html.text "Paste new JS" ]
    ]


viewTextarea : Html Msg
viewTextarea =
    Html.textarea
        [ Html.Attributes.class "AbsoluteFill Textarea"
        , Html.Attributes.placeholder placeholder
        , Html.Attributes.value ""
        , Html.Events.onInput TextareaChanged
        ]
        []


placeholder : String
placeholder =
    -- Note: It’s not ideal to have the command in the placeholder, since you cannot copy it.
    """Paste compiled JavaScript from Elm here.

For example, the contents of elm.js in `elm make src/Main.elm --output elm.js`.
"""


viewGraph : Dict String (Set String) -> Html msg
viewGraph functions =
    let
        dot =
            Graph.DOT.outputWithStylesAndAttributes
                { rankdir = Graph.DOT.TB
                , graph = ""
                , node = "fontname=\"inherit\", shape=box, style=\"filled\", colorscheme=\"pastel19\""
                , edge = ""
                }
                (\graphNode ->
                    Dict.fromList
                        [ ( "label", graphNode )
                        , ( "color", "1" )
                        ]
                )
                (\_ -> Dict.empty)
                (makeGraph functions)
    in
    Html.node "graphviz-dot"
        [ Html.Attributes.attribute "dot" dot
        , Html.Attributes.class "AbsoluteFill"
        ]
        []


functionRegex : Regex
functionRegex =
    -- Functions that use themselves inside themselves in certain ways are defined
    -- with `function $some$module$cyclic$functionName`, while everything else is
    -- defined with `var`.
    Regex.fromStringWith { caseInsensitive = False, multiline = True }
        "^(?:var|function) (\\$[^\\s()]+)(.*(?:\\r?\\n\\t.*)*)"
        |> Maybe.withDefault Regex.never


referencesRegex : Regex
referencesRegex =
    -- Matches string literals, multiline comments, singleline comments and some identifiers.
    -- We’re only interested in `$foo` – but only outside strings and comments.
    -- And not things like `_v0$2` or `_v1.$9` or `{ $9: something }`.
    -- Parts copied from: https://github.com/lydell/js-tokens/blob/15439aa6c3a66afa852c3549f8f57076935ead1f/index.coffee
    Regex.fromString
        """(['"])(?:(?!\\1)[^\\\\\\n\\r]|\\\\(?:\\r\\n|[^]))*(\\1)?|\\/\\*(?:[^*]|\\*(?!\\/))*(\\*\\/)?|\\/\\/.*|\\w*\\.?\\$[^\\s!"#%&'()*+,\\-./:;<=>?@\\[\\]^`{|}~]+\\b(?!:)"""
        |> Maybe.withDefault Regex.never


entrypointsRegex : Regex
entrypointsRegex =
    Regex.fromStringWith { caseInsensitive = False, multiline = True }
        "^_Platform_export\\(.*(?:\\r?\\n\\t.*)*"
        |> Maybe.withDefault Regex.never


parse : String -> Dict String (Set String)
parse string =
    Regex.find functionRegex string
        |> List.filterMap
            (\match ->
                case match.submatches of
                    [ Just name, Just body ] ->
                        Just ( name, parseReferences body |> Set.fromList )

                    _ ->
                        Nothing
            )
        |> Dict.fromList


parseReferences : String -> List String
parseReferences string =
    Regex.find referencesRegex string
        |> List.map .match
        |> List.filter
            (\name ->
                String.startsWith "$" name
                    && not (String.startsWith "$temp$" name)
                    && not (String.startsWith "$elm$" name)
            )


parseEntrypoints : String -> List String
parseEntrypoints string =
    case Regex.findAtMost 1 entrypointsRegex string of
        [ match ] ->
            parseReferences match.match
                |> List.filter (String.startsWith "$author$project$")

        _ ->
            []


invert : Dict String (Set String) -> Dict String (Set String)
invert functions =
    functions
        |> Dict.foldl
            (\name references acc ->
                references
                    |> Set.foldl
                        (\reference acc2 ->
                            acc2
                                |> Dict.update reference
                                    (\previous ->
                                        case previous of
                                            Just set ->
                                                Just (Set.insert name set)

                                            Nothing ->
                                                Just (Set.singleton name)
                                    )
                        )
                        acc
            )
            Dict.empty


referencing : Dict String (Set String) -> String -> Set String
referencing inverted name =
    referencingHelper inverted [ name ] Set.empty


referencingHelper : Dict String (Set String) -> List String -> Set String -> Set String
referencingHelper inverted names acc =
    case names of
        [] ->
            acc

        name :: rest ->
            if Set.member name acc then
                referencingHelper inverted rest acc

            else
                case Dict.get name inverted of
                    Just set ->
                        referencingHelper
                            inverted
                            (rest ++ Set.toList set)
                            (Set.insert name acc)

                    Nothing ->
                        acc


prune : String -> Dict String (Set String) -> Dict String (Set String)
prune name functions =
    pruneHelper [ name ] functions Dict.empty


pruneHelper : List String -> Dict String (Set String) -> Dict String (Set String) -> Dict String (Set String)
pruneHelper names functions acc =
    case names of
        [] ->
            acc

        name :: rest ->
            if Dict.member name acc then
                pruneHelper rest functions acc

            else
                case Dict.get name functions of
                    Just references ->
                        pruneHelper
                            (rest ++ Set.toList references)
                            functions
                            (Dict.insert name references acc)

                    Nothing ->
                        Dict.empty


makeGraph : Dict String (Set String) -> Graph String ()
makeGraph functions =
    let
        functionsWithIds : List ( NodeId, String, Set String )
        functionsWithIds =
            functions
                |> Dict.toList
                |> List.indexedMap (\id ( name, references ) -> ( id, name, references ))

        ids : Dict String NodeId
        ids =
            functionsWithIds
                |> List.map (\( id, name, _ ) -> ( name, id ))
                |> Dict.fromList

        getId : String -> Maybe NodeId
        getId name =
            Dict.get name ids

        nodes =
            functionsWithIds
                |> List.map
                    (\( id, name, _ ) ->
                        Node id (functionNameToString (parseFunctionName name))
                    )

        edges =
            functionsWithIds
                |> List.concatMap
                    (\( fromId, name, references ) ->
                        references
                            |> Set.toList
                            |> List.filterMap
                                (\reference ->
                                    getId reference
                                        |> Maybe.map
                                            (\toId ->
                                                Edge fromId toId ()
                                            )
                                )
                    )
    in
    Graph.fromNodesAndEdges nodes edges


type Search
    = ByName { name : String }
    | ByPackage { author : String, package : String }


parseSearch : String -> Search
parseSearch string =
    case String.split "/" string of
        [ author, package ] ->
            ByPackage { author = author, package = package }

        _ ->
            ByName { name = string }


matchFunction : Search -> String -> Bool
matchFunction search functionNameString =
    let
        functionName =
            parseFunctionName functionNameString
    in
    case search of
        ByName { name } ->
            case functionName of
                App data ->
                    String.startsWith name (String.join "." data.name)

                Package data ->
                    String.startsWith name (String.join "." data.name)

                Unknown unknownName ->
                    String.startsWith name unknownName

        ByPackage { author, package } ->
            case functionName of
                App _ ->
                    False

                Package data ->
                    author == data.author && package == data.package

                Unknown _ ->
                    False


type FunctionName
    = App { name : List String }
    | Package { author : String, package : String, name : List String }
    | Unknown String


parseFunctionName : String -> FunctionName
parseFunctionName name =
    case String.split "$" name of
        "" :: "author" :: "project" :: rest ->
            App { name = rest }

        "" :: author :: package :: rest ->
            Package { author = dash author, package = dash package, name = rest }

        _ ->
            Unknown name


functionNameToString : FunctionName -> String
functionNameToString functionName =
    case functionName of
        App { name } ->
            String.join "." name

        Package { author, package, name } ->
            author ++ "/" ++ package ++ "\n" ++ String.join "." name

        Unknown name ->
            name


dash : String -> String
dash =
    String.replace "_" "-"
