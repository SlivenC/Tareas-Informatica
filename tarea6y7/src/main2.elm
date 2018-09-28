--HOJA DE TRABAJO 7
module Main exposing (..)

suma: Int -> Int -> Int 
suma x y = x + y 

mult: Int -> Int -> Int 
mult q w = q * w 

type Expresion = Suma Expresion Expresion | Multiplicacion Expresion Expresion  | Valor Int 
    

reducir : (Int -> Int -> Int , Int -> Int -> Int) -> Expresion -> Int
reducir (isuma, imult) oper =
    case oper of
        Suma op1 op2 -> isuma (reducir (isuma, imult) op1) (reducir (isuma, imult) op2)
        mult op1 op2 -> imult (reducir (isuma, imult) op1) (reducir (isuma, imult) op2)
        Valor n -> n
