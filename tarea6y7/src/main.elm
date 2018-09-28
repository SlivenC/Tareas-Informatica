--HOJA DE TRABAJO 6
module Main exposing (..)
type Natural = Suc Natural | Cero 
resta : Natural ->  Natural -> Natural 
resta x y = case (x,y) of
    (Cero, y_) -> Cero 
    (x_, Cero) -> x
    (Suc x_, Suc y_)-> resta x_  y_

suma : Natural ->  Natural -> Natural 
suma x y = case (x,y) of
    (Cero, y_) -> y 
    (x_, Cero) -> x
    (Suc x_, Suc y_)-> suma x_  y_
    
mult : Natural ->  Natural -> Natural 
mult x y = case (x,y) of
    (Cero, y_) -> Cero 
    (x_, Cero) -> Cero
    (x_, Suc y_)-> suma (x_) (mult x_ y_)
  

divi: Natural -> Natural -> (Natural, Natural)
divi x_ y_ =
    if mult (div x_ y_ Cero) x_ == y_ 
    then (div x_ y_ Cero, Cero)  
    else (resta (div x_ y_ Cero) (Suc Cero), resta (x_ )(mult (resta(div x_ y_ Cero)(Suc Cero)) y_ ))

div: Natural -> Natural -> Natural -> Natural 
div x y z = case (x, y, z) of
    (Cero, y_, z_) -> z_
    (x_, Cero, _) -> Cero 
    (x_, y_, z_) ->  div (resta x_ y_) z_ (suma z_(Suc Cero))

type GExpresion x = Valor x 
    | Suma (GExpresion x) (GExpresion x)
    | Mult (GExpresion x) (GExpresion x)

type alias Expresion = GExpresion Int

type Estado = Final Int 
    | Pares (List Char)

