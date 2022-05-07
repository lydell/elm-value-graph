module Main exposing (Model, Msg, Page, main)

import Browser
import Browser.Dom
import Dict exposing (Dict)
import Fixture
import Graph exposing (Edge, Graph, Node, NodeId)
import Graph.DOT
import Html exposing (Html)
import Html.Attributes
import Html.Events
import Regex exposing (Regex)
import Set exposing (Set)
import Task


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
    , infoShown : Bool
    }


type Page
    = Textarea
    | Graph GraphData


type alias GraphData =
    { search : String
    , pruned : Dict String (Set String)
    , inverted : Dict String (Set String)
    , suggestions : List String
    }


init : () -> ( Model, Cmd Msg )
init () =
    ( { page = Textarea
      , infoShown = False
      }
    , focusTextarea
    )


type Msg
    = TextareaChanged String
    | BackToTextareaPressed
    | SearchChanged String
    | TextareaFocused
    | InfoButtonPressed
    | PasteExamplePressed


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        TextareaChanged code ->
            ( { model | page = enterGraph code }, Cmd.none )

        BackToTextareaPressed ->
            ( { model | page = Textarea }, focusTextarea )

        SearchChanged text ->
            case model.page of
                Textarea ->
                    ( model, Cmd.none )

                Graph data ->
                    ( { model | page = Graph { data | search = text } }, Cmd.none )

        TextareaFocused ->
            ( model, Cmd.none )

        InfoButtonPressed ->
            ( { model | infoShown = not model.infoShown }, Cmd.none )

        PasteExamplePressed ->
            ( { model | page = enterGraph Fixture.fixture }, Cmd.none )


focusTextarea : Cmd Msg
focusTextarea =
    Browser.Dom.focus textareaId
        |> Task.attempt (always TextareaFocused)


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none


maxGraphSize : number
maxGraphSize =
    1000


view : Model -> Html Msg
view model =
    case model.page of
        Textarea ->
            viewContainer
                { toolbar = viewTextareaToolbar model.infoShown
                , content = viewTextarea
                , infoShown = model.infoShown
                }

        Graph { search, pruned, inverted, suggestions } ->
            let
                parsedSearch : Search
                parsedSearch =
                    parseSearch search

                matches : List String
                matches =
                    pruned
                        |> Dict.keys
                        |> List.filter (matchValue parsedSearch)

                valuesToKeep : Set String
                valuesToKeep =
                    matches
                        |> List.foldl
                            (referencing inverted >> Set.union)
                            (Set.fromList matches)

                filtered : Dict String (Set String)
                filtered =
                    pruned
                        |> Dict.filter (\name _ -> Set.member name valuesToKeep)
            in
            viewContainer
                { toolbar = viewGraphToolbar model.infoShown search suggestions
                , content =
                    if Dict.isEmpty pruned then
                        viewEmpty "I could not find anything interesting in the stuff you pasted. Did you really paste compiled Elm JavaScript? Or did you find a bug?"

                    else if List.isEmpty matches then
                        viewEmpty "Your search query does not seem to match anything."

                    else if Set.isEmpty valuesToKeep then
                        viewEmpty "I tried to find all everything to keep related to your search query, but that resulted in zero things to keep! Sounds like a bug."

                    else if Dict.isEmpty filtered then
                        viewEmpty "Filtering the graph using your search query ended up with an empty graph! But I did find matching stuff, so this sounds like a bug."

                    else if Dict.size filtered > maxGraphSize then
                        viewEmpty <|
                            "The graph contains "
                                ++ String.fromInt (Dict.size filtered)
                                ++ " nodes. I only display graphs with "
                                ++ String.fromInt maxGraphSize
                                ++ " nodes or less. Otherwise the graph renderer (Graphviz) tends to hang."

                    else
                        viewGraph filtered
                , infoShown = model.infoShown
                }


viewEmpty : String -> Html msg
viewEmpty message =
    Html.p [] [ Html.text message ]


viewContainer :
    { toolbar : List (Html msg)
    , content : Html msg
    , infoShown : Bool
    }
    -> Html msg
viewContainer { toolbar, content, infoShown } =
    Html.div [ Html.Attributes.class "Container AbsoluteFill" ]
        [ Html.div [ Html.Attributes.class "Container-toolbar" ]
            toolbar
        , Html.div [ Html.Attributes.class "Container-inner" ]
            [ Html.div [ Html.Attributes.class "Container-content" ]
                [ content
                ]
            , if infoShown then
                Html.div [ Html.Attributes.class "Container-info" ]
                    viewInfo

              else
                Html.text ""
            ]
        ]


viewToolbarTitle : Html msg
viewToolbarTitle =
    Html.text "Why does my Elm app depend on …?"


viewInfoButton : Bool -> Html Msg
viewInfoButton infoShown =
    Html.button
        [ Html.Attributes.style "justify-self" "flex-end"
        , Html.Events.onClick InfoButtonPressed
        ]
        [ Html.text
            (if infoShown then
                "Hide info"

             else
                "Info"
            )
        ]


viewTextareaToolbar : Bool -> List (Html Msg)
viewTextareaToolbar infoShown =
    [ viewToolbarTitle
    , Html.button [ Html.Events.onClick PasteExamplePressed ]
        [ Html.text "Paste example" ]
    , Html.div [ Html.Attributes.style "margin-left" "auto" ] [ viewInfoButton infoShown ]
    ]


searchFieldId : String
searchFieldId =
    "searchFieldId"


viewGraphToolbar : Bool -> String -> List String -> List (Html Msg)
viewGraphToolbar infoShown search suggestions =
    [ viewToolbarTitle
    , Html.label
        [ Html.Attributes.class "SearchField"
        , Html.Attributes.style "flex" "1"
        , Html.Attributes.style "max-width" "30em"
        ]
        [ Html.span [ Html.Attributes.class "SearchField-label" ]
            [ Html.text "Fully.Qualified.name or author/package" ]
        , Html.input
            [ Html.Attributes.value search
            , Html.Events.onInput SearchChanged
            , Html.Attributes.placeholder "For example “Html.Styled.toUnstyled” or “rtfeldman/elm-css”"
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
    , viewInfoButton infoShown
    ]


textareaId : String
textareaId =
    "textareaId"


viewTextarea : Html Msg
viewTextarea =
    Html.textarea
        [ Html.Attributes.class "AbsoluteFill Textarea"
        , Html.Attributes.placeholder placeholder
        , Html.Attributes.value ""
        , Html.Events.onInput TextareaChanged
        , Html.Attributes.id textareaId
        ]
        []


placeholder : String
placeholder =
    -- Note: It’s not ideal to have the command in the placeholder, since you cannot copy it.
    """Paste compiled JavaScript from Elm here to analyze.

For example, the contents of elm.js in `elm make src/Main.elm --output elm.js`.
"""


viewGraph : Dict String (Set String) -> Html msg
viewGraph values =
    let
        dot : String
        dot =
            Graph.DOT.outputWithStylesAndAttributes
                { rankdir = Graph.DOT.TB
                , graph = ""
                , node = "fontname=\"inherit\", shape=box, style=\"filled\", colorscheme=\"pastel19\""
                , edge = ""
                }
                (\graphNode ->
                    Dict.fromList
                        [ ( "label", graphNode.label )
                        , ( "color", graphNode.color )
                        ]
                )
                (\_ -> Dict.empty)
                (makeGraph values)
    in
    Html.node "graphviz-dot"
        [ Html.Attributes.attribute "dot" dot
        , Html.Attributes.class "AbsoluteFill"
        ]
        []


enterGraph : String -> Page
enterGraph code =
    let
        parsed : Dict String (Set String)
        parsed =
            parse code

        pruned : Dict String (Set String)
        pruned =
            parseEntrypoints code
                |> List.foldl prune parsed

        inverted : Dict String (Set String)
        inverted =
            invert pruned

        suggestions : List String
        suggestions =
            pruned
                |> Dict.keys
                |> List.concatMap
                    (\valueName ->
                        case parseName valueName of
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
    Graph
        { search = ""
        , pruned = pruned
        , inverted = inverted
        , suggestions = suggestions
        }


valueRegex : Regex
valueRegex =
    -- Values that use themselves inside themselves in certain ways are defined
    -- with `function $some$module$cyclic$functionName`, while everything else is
    -- defined with `var`. The cyclic ones are wrapped in `try {}` during development –
    -- that’s the only time a definition can be indented.
    Regex.fromStringWith { caseInsensitive = False, multiline = True }
        "^\t?(?:var|function) (\\$[^\\s()]+)(.*(?:\\r?\\n\\t.*)*)"
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
    Regex.find valueRegex string
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
invert =
    Dict.foldl
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
                        referencingHelper
                            inverted
                            rest
                            (Set.insert name acc)


prune : String -> Dict String (Set String) -> Dict String (Set String)
prune name parsed =
    pruneHelper [ name ] parsed Dict.empty


pruneHelper : List String -> Dict String (Set String) -> Dict String (Set String) -> Dict String (Set String)
pruneHelper names parsed acc =
    case names of
        [] ->
            acc

        name :: rest ->
            if Dict.member name acc then
                pruneHelper rest parsed acc

            else
                case Dict.get name parsed of
                    Just references ->
                        pruneHelper
                            (rest ++ Set.toList references)
                            parsed
                            (Dict.insert name references acc)

                    Nothing ->
                        Dict.empty


makeGraph : Dict String (Set String) -> Graph NodeData ()
makeGraph values =
    let
        valuesWithIds : List ( NodeId, String, Set String )
        valuesWithIds =
            values
                |> Dict.toList
                |> List.indexedMap (\id ( name, references ) -> ( id, name, references ))

        ids : Dict String NodeId
        ids =
            valuesWithIds
                |> List.map (\( id, name, _ ) -> ( name, id ))
                |> Dict.fromList

        getId : String -> Maybe NodeId
        getId name =
            Dict.get name ids

        nodes : List (Node NodeData)
        nodes =
            valuesWithIds
                |> List.map
                    (\( id, name, _ ) ->
                        Node id (valueNameToNodeData (parseName name))
                    )

        edges : List (Edge ())
        edges =
            valuesWithIds
                |> List.concatMap
                    (\( fromId, _, references ) ->
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


matchValue : Search -> String -> Bool
matchValue search valueNameString =
    let
        valueName : Name
        valueName =
            parseName valueNameString
    in
    case search of
        ByName { name } ->
            case valueName of
                App data ->
                    String.startsWith name (String.join "." data.name)

                Package data ->
                    String.startsWith name (String.join "." data.name)

                Unknown unknownName ->
                    String.startsWith name unknownName

        ByPackage { author, package } ->
            case valueName of
                App _ ->
                    False

                Package data ->
                    author == data.author && package == data.package

                Unknown _ ->
                    False


type Name
    = App { name : List String }
    | Package { author : String, package : String, name : List String }
    | Unknown String


parseName : String -> Name
parseName name =
    case String.split "$" name of
        "" :: "author" :: "project" :: rest ->
            App { name = rest }

        "" :: author :: package :: rest ->
            Package { author = dash author, package = dash package, name = rest }

        _ ->
            Unknown name


type alias NodeData =
    { label : String
    , color : String
    }


valueNameToNodeData : Name -> NodeData
valueNameToNodeData valueName =
    case valueName of
        App { name } ->
            { label = String.join "." name
            , color = "1"
            }

        Package { author, package, name } ->
            { label = author ++ "/" ++ package ++ "\n" ++ String.join "." name
            , color = "2"
            }

        Unknown name ->
            { label = name
            , color = "3"
            }


dash : String -> String
dash =
    String.replace "_" "-"


viewInfo : List (Html msg)
viewInfo =
    [ Html.p [] [ Html.text "This app shows you how every function – or any value – in an Elm application depend on each other, as a graph. It lets you answer questions like “why do I depend on this package?”." ]
    , Html.p [] [ Html.text "Note: All elm/* packages are excluded because they made the graph too noisy." ]
    , Html.p [] [ Html.text "Warning: This is essentially a quick hack. I run a bunch of regex on the compiled JavaScript output. It seems to work good enough, though." ]
    , Html.p [] [ Html.text "Source code: ", Html.a [ Html.Attributes.href "https://github.com/lydell/elm-value-graph" ] [ Html.text "github.com/lydell/elm-value-graph" ] ]
    ]
