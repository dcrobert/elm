

import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)
import Http


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , update = update
        , subscriptions = \_ -> Sub.none
        , view = view
        }



{-
    MODEL
    * Model type
    * Initialize model with empty values
-}


type alias Model =
    { quote : String
    }

init : (Model, Cmd Msg)
init =
    ( Model "", fetchResultCmd )



{-
   UPDATE
   * Messages
   * Update case
-}


type Msg = GetQuote

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        GetQuote ->
            ( { model | quote = model.quote ++ "Result: " }, Cmd.none )



{-
   VIEW
   * Get a result
-}


view : Model -> Html Msg
view model =
    div [ class "container" ] [
        h2 [ class "text-center" ] [ text "Elm Api Dev" ]
        , p [ class "text-center" ] [
            button [ class "btn btn-success", onClick GetQuote ] [ text "Fetch a Result!" ]
        ]
        -- Blockquote with quote
        , blockquote [] [
            p [] [text model.quote]
        ]
    ]
