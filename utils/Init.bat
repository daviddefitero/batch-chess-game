@echo off

set "empty=   "
set "wPawn=WP "
set "wRook=WR "
set "wKnight=WN "
set "wBishop=WB "
set "wQueen=WQ "
set "wKing=WK "
set "bPawn=BP "
set "bRook=BR "
set "bKnight=BN "
set "bBishop=BB "
set "bQueen=BQ "
set "bKing=BK "
set "selected=SEL"
set "possible=(*)"

REM Inicializar el tablero
for /L %%i in (1,1,8) do (
    for /L %%j in (1,1,8) do (
        set "board_%%i_%%j=!empty!"
    )
)

REM Fijar las posiciones iniciales
REM Piezas blancas
for /L %%i in (1,1,8) do set "board_2_%%i=!wPawn!"
set "board_1_1=!wRook!"
set "board_1_8=!wRook!"
set "board_1_2=!wKnight!"
set "board_1_7=!wKnight!"
set "board_1_3=!wBishop!"
set "board_1_6=!wBishop!"
set "board_1_4=!wQueen!"
set "board_1_5=!wKing!"

REM Piezas negras
for /L %%i in (1,1,8) do set "board_7_%%i=!bPawn!"
set "board_8_1=!bRook!"
set "board_8_8=!bRook!"
set "board_8_2=!bKnight!"
set "board_8_7=!bKnight!"
set "board_8_3=!bBishop!"
set "board_8_6=!bBishop!"
set "board_8_4=!bQueen!"
set "board_8_5=!bKing!"

set "turn=White"
set "whiteCaptured=0"
set "blackCaptured=0"
