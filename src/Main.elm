module Main exposing (main)

import Browser
import Dict
import Graph exposing (Edge, Graph, Node)
import Graph.DOT
import Html exposing (Html)
import Html.Attributes


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


init : flags -> ( Model, Cmd Msg )
init flags =
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
subscriptions model =
    Sub.none


view : Model -> Html Msg
view model =
    let
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
                dressUp
    in
    Html.node "graphviz-dot"
        [ Html.Attributes.attribute "dot" dot
        , Html.Attributes.style "position" "absolute"
        , Html.Attributes.style "top" "0"
        , Html.Attributes.style "left" "0"
        , Html.Attributes.style "width" "100%"
        , Html.Attributes.style "height" "100%"
        , Html.Attributes.style "display" "flex"
        ]
        []


dressUp : Graph String ()



-- node labels are strings, edge labels are empty


dressUp =
    let
        nodes =
            [ Node 0 "Socks"
            , Node 1 "Undershirt"
            , Node 2 "Pants"
            , Node 3 "Shoes"
            , Node 4 "Watch"
            , Node 5 "Shirt"
            , Node 6 "Belt"
            , Node 7 "Tie"
            , Node 8 "Jacket"
            ]

        e from to =
            Edge from to ()

        edges =
            [ e 0 3 -- socks before shoes
            , e 1 2 -- undershorts before pants
            , e 1 3 -- undershorts before shoes
            , e 2 3 -- pants before shoes
            , e 2 6 -- pants before belt
            , e 5 6 -- shirt before belt
            , e 5 7 -- shirt before tie
            , e 6 8 -- belt before jacket
            , e 7 8 -- tie before jacket
            ]
    in
    Graph.fromNodesAndEdges nodes edges
