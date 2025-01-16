REM Borra la selección y los posibles movimientos
REM PROBLEMA: Borra las piezas que se en los posibles movimientos
REM POSIBLE SOLUCION: Guardar la posicion de las piezas y volver a ponerlas después de borrar los posibles movimientos. La complicacion va a ser hacer otro array para las posiciones, pero creo que no me va a dar tiempo.
for /L %%i in (1,1,8) do (
    for /L %%j in (1,1,8) do (
        if "!board_%%i_%%j!"=="%selected%" set "board_%%i_%%j=!selectedPiece!"
        if "!board_%%i_%%j!"=="%possible%" set "board_%%i_%%j=%empty%"
    )
)
set "selectedPiece="
set "selectedRow="
set "selectedCol="