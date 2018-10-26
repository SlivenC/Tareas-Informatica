module Main exposing (..)



import Browser
import Html exposing (Html)
import Html.Events exposing (onClick)



type alias Modelo = String

modeloInicial : Modelo
modeloInicial = ""


calculator : Calculadora
calculator = 
    { suma = (\x y -> x + y) ,mult = (\x y -> x * y)   }

type alias Calculadora =    { suma : Float -> Float -> Float , mult : Float -> Float -> Float  }





type alias Mensaje = String

actualizador : Mensaje -> Modelo -> Modelo
actualizador mensaje modelo =  if mensaje == "C" then modeloInicial else if mensaje == "=" then "0 " else modelo ++ mensaje
    
      

vista : Modelo -> Html Mensaje
vista modelo = Html.div
    []
    [
        Html.text (modelo),          
        Html.div [] [
            Html.button [onClick "0"] [Html.text "0"],
        Html.div [] [
            Html.button [onClick "1"] [Html.text "1"],
            Html.button [onClick "2"] [Html.text "2"],
            Html.button [onClick "3"] [Html.text "3"],
        Html.div [] [
            Html.button [onClick "4"] [Html.text "4"],
            Html.button [onClick "5"] [Html.text "5"],
            Html.button [onClick "6"] [Html.text "6"],
        Html.div [] [
            Html.button [onClick "7"] [Html.text "7"],
            Html.button [onClick "8"] [Html.text "8"],
            Html.button [onClick "9"] [Html.text "9"], 
              

        --Operaciones 
        Html.div [] [       
        Html.button [onClick ("+")] [Html.text "+"],
        Html.button [onClick "*"] [Html.text "*"],
        Html.button [onClick ("C")] [Html.text "C"],
        Html.button [onClick "="] [Html.text "="]] ] ] ] ]
    
        
       
    ]

main = Browser.sandbox {
        init = modeloInicial,
        view = vista,
        update = actualizador
        }


