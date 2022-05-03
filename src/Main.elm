module Main exposing (main)

import Browser
import Dict exposing (Dict)
import Fixture
import Graph exposing (Edge, Graph, Node, NodeId)
import Graph.DOT
import Html exposing (Html)
import Html.Attributes
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
    { property : Int
    , property2 : String
    }


init : () -> ( Model, Cmd Msg )
init () =
    ( Model 0 "modelInitialValue2", Cmd.none )


type Msg
    = Msg1
    | Msg2


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Msg1 ->
            ( model, Cmd.none )

        Msg2 ->
            ( model, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none


view : Model -> Html Msg
view model =
    let
        code =
            Fixture.fixture

        graph =
            parseEntrypoints code
                |> List.foldl prune (parse code)
                |> makeGraph

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
    Html.div []
        [ Html.node "graphviz-dot"
            [ Html.Attributes.attribute "dot" dot
            , Html.Attributes.style "position" "absolute"
            , Html.Attributes.style "top" "0"
            , Html.Attributes.style "left" "0"
            , Html.Attributes.style "width" "100%"
            , Html.Attributes.style "height" "100%"
            , Html.Attributes.style "display" "flex"
            ]
            []

        -- , Html.div
        --     [ Html.Attributes.style "position" "absolute"
        --     , Html.Attributes.style "top" "0"
        --     , Html.Attributes.style "left" "0"
        --     , Html.Attributes.style "background" "white"
        --     , Html.Attributes.style "padding" "1em"
        --     ]
        --     [ entrypoints
        --         |> Debug.toString
        --         |> Html.text
        --     ]
        ]


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
            )


parseEntrypoints : String -> List String
parseEntrypoints string =
    case Regex.findAtMost 1 entrypointsRegex string of
        [ match ] ->
            parseReferences match.match
                |> List.filter (String.startsWith "$author$project$")

        _ ->
            []


prune : String -> Dict String (Set String) -> Dict String (Set String)
prune name functions =
    pruneHelper name functions Dict.empty


pruneHelper : String -> Dict String (Set String) -> Dict String (Set String) -> Dict String (Set String)
pruneHelper name functions acc =
    case Dict.get name functions of
        Just references ->
            references
                |> Set.toList
                |> List.foldl
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
