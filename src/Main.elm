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
    | Graph { code : String }


init : () -> ( Model, Cmd Msg )
init () =
    ( { page = Textarea }, Cmd.none )


type Msg
    = TextareaChanged String
    | Msg2


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        TextareaChanged code ->
            ( { model | page = Graph { code = code } }, Cmd.none )

        Msg2 ->
            ( model, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none


view : Model -> Html Msg
view model =
    Html.div [ Html.Attributes.class "Container AbsoluteFill" ]
        [ Html.div [ Html.Attributes.class "Container-toolbar" ]
            [ Html.text "Find references to an Elm value “recursively”"
            ]
        , Html.div [ Html.Attributes.class "Container-content" ]
            [ case model.page of
                Textarea ->
                    viewTextarea

                Graph { code } ->
                    viewGraph code
            ]
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


viewGraph : String -> Html Msg
viewGraph code =
    let
        functions =
            parseEntrypoints code
                |> List.foldl prune (parse code)

        matches =
            functions
                |> Dict.keys
                |> List.filter ((==) "$elm_community$intdict$IntDict$higherBitMask")

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

        graph =
            makeGraph filtered

        dot =
            Graph.DOT.outputWithStylesAndAttributes
                { rankdir = Graph.DOT.TB
                , graph = ""
                , node = "fontname=\"helvetica\", shape=box, style=\"filled\", colorscheme=\"pastel19\""
                , edge = "fontname=\"helvetica\""
                }
                (\graphNode ->
                    Dict.fromList
                        [ ( "label", graphNode )
                        , ( "color", "1" )
                        ]
                )
                (\edge ->
                    Dict.fromList
                        [--     ( "label", edge.label )
                         -- , ( "labeltooltip", edge.relation )
                        ]
                )
                graph
    in
    Html.node "graphviz-dot"
        [ Html.Attributes.attribute "dot" dot
        , Html.Attributes.class "AbsoluteFill"
        ]
        []


functionRegex : Regex
functionRegex =
    Regex.fromStringWith { caseInsensitive = False, multiline = True }
        "^var (\\$\\S+) =(.*(?:\\r?\\n\\t.*)*)"
        |> Maybe.withDefault Regex.never


referencesRegex : Regex
referencesRegex =
    Regex.fromString
        """(['"])(?:(?!\\1)[^\\\\\\n\\r]|\\\\(?:\\r\\n|[^]))*(\\1)?|\\/\\*(?:[^*]|\\*(?!\\/))*(\\*\\/)?|\\/\\/.*|\\$[^\\s!"#%&'()*+,\\-./:;<=>?@\\[\\]^`{|}~]+\\b"""
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
    referencingHelper inverted name Set.empty


referencingHelper : Dict String (Set String) -> String -> Set String -> Set String
referencingHelper inverted name acc =
    case Dict.get name inverted of
        Just set ->
            set
                |> Set.foldl
                    (\name2 acc2 ->
                        if Set.member name2 acc2 then
                            acc2

                        else
                            referencingHelper inverted name2 (Set.insert name2 acc2)
                    )
                    acc

        Nothing ->
            acc


prune : String -> Dict String (Set String) -> Dict String (Set String)
prune name functions =
    pruneHelper name functions Dict.empty


pruneHelper : String -> Dict String (Set String) -> Dict String (Set String) -> Dict String (Set String)
pruneHelper name functions acc =
    case Dict.get name functions of
        Just references ->
            references
                |> Set.foldl
                    (\reference acc2 ->
                        if Dict.member reference acc2 then
                            acc2

                        else
                            pruneHelper reference functions acc2
                    )
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
                        Node id (niceFunctionName name)
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


niceFunctionName : String -> String
niceFunctionName name =
    case String.split "$" name of
        "" :: "author" :: "project" :: rest ->
            String.join "." rest

        "" :: author :: package :: rest ->
            dash author ++ "/" ++ dash package ++ "\n" ++ String.join "." rest

        _ ->
            name


dash : String -> String
dash =
    String.replace "_" "-"
