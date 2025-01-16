call .\utils\Init.bat

:gameLoop
cls
echo =====================================
echo               AJEDREZ     
echo =====================================
echo.
echo.
echo Turno: %turn%
echo.

call .\utils\ShowBoard.bat "%empty%" "%selected%" "%possible%" "%wPawn%" "%wRook%" "%wKnight%" "%wBishop%" "%wQueen%" "%wKing%" "%bPawn%" "%bRook%" "%bKnight%" "%bBishop%" "%bQueen%" "%bKing%" board_1_1 board_1_2 board_1_3 board_1_4 board_1_5 board_1_6 board_1_7 board_1_8 board_2_1 board_2_2 board_2_3 board_2_4 board_2_5 board_2_6 board_2_7 board_2_8 board_3_1 board_3_2 board_3_3 board_3_4 board_3_5 board_3_6 board_3_7 board_3_8 board_4_1 board_4_2 board_4_3 board_4_4 board_4_5 board_4_6 board_4_7 board_4_8 board_5_1 board_5_2 board_5_3 board_5_4 board_5_5 board_5_6 board_5_7 board_5_8 board_6_1 board_6_2 board_6_3 board_6_4 board_6_5 board_6_6 board_6_7 board_6_8 board_7_1 board_7_2 board_7_3 board_7_4 board_7_5 board_7_6 board_7_7 board_7_8 board_8_1 board_8_2 board_8_3 board_8_4 board_8_5 board_8_6 board_8_7 board_8_8

set /p "move=Introduce una posicion (e.g. E2) o D para deseleccionar: "
if /I "%move%"=="D" (
    call .\utils\ClearSelection.bat
    goto gameLoop
)

set "col=%move:~0,1%"
set "row=%move:~1,1%"

call .\utils\LetterToNumber.bat col

REM Si hay una pieza seleccionada, este es el movimiento de destino
if defined selectedPiece (
    REM Compro bar si el movimiento es válido
    if "!board_%row%_%col%!"=="%possible%" (
        REM Mover pieza a la nueva posicion
        set "board_%row%_%col%=!selectedPiece!"
        REM Borrar la pieza de la posición anterior
        set "board_%selectedRow%_%selectedCol%=%empty%"
        REM Cambiar de turno
        if "%turn%"=="White" (
            set "turn=Black"
        ) else (
            set "turn=White"
        )
        REM Limpiar la selección
        call .\utils\ClearSelection.bat
        goto gameLoop
    ) else (
        echo Movimiento invalido!
        pause
        goto gameLoop
    )
) else (
    REM Si no hay una pieza seleccionada, seleccionar la pieza en la posición actual
    set "piece=!board_%row%_%col%!"
    if "%turn%"=="White" (
        if "!piece:~0,1!"=="B" (
            echo Es el turno de las blancas!
            pause
            goto gameLoop
        )
    ) else (
        if "!piece:~0,1!"=="W" (
            echo Es el turno de las negras!
            pause
            goto gameLoop
        )
    )
)

REM Guardar pieza seleccionada
set "piece=!board_%row%_%col%!"
if "!piece!"=="%empty%" (
    echo No hay ninguna pieza en esa posicion!
    pause
    goto gameLoop
)

REM Marcar la pieza seleccionada y guardar su posicion
set "selectedPiece=!piece!"
set "selectedRow=%row%"
set "selectedCol=%col%"
set "board_%row%_%col%=!selected!"

REM Mostrar posibles movimientos por cada ficha
REM -------------------------------------------
if "!piece!"=="%wPawn%" (
    set /a "newRow=%row%+1"
    if !newRow! leq 8 set "board_!newRow!_%col%=!possible!"
)

if "!piece!"=="%bPawn%" (
    set /a "newRow=%row%-1"
    if !newRow! geq 1 set "board_!newRow!_%col%=!possible!"
)

if "!piece!"=="%wRook%" (
    REM Rook moves horizontally and vertically
    for /L %%i in (1,1,8) do (
        if not %%i==%row% set "board_%%i_%col%=!possible!"
        if not %%i==%col% set "board_%row%_%%i=!possible!"
    )
)

if "!piece!"=="%bRook%" (
    REM Same as white rook
    for /L %%i in (1,1,8) do (
        if not %%i==%row% set "board_%%i_%col%=!possible!"
        if not %%i==%col% set "board_%row%_%%i=!possible!"
    )
)

if "!piece!"=="%wKnight%" (
    REM Knight moves in L-shape
    set /a "r=%row%+2"
    set /a "c=%col%+1"
    if !r! leq 8 if !c! leq 8 set "board_!r!_!c!=!possible!"
    set /a "c=%col%-1"
    if !r! leq 8 if !c! geq 1 set "board_!r!_!c!=!possible!"
    
    set /a "r=%row%-2"
    set /a "c=%col%+1"
    if !r! geq 1 if !c! leq 8 set "board_!r!_!c!=!possible!"
    set /a "c=%col%-1"
    if !r! geq 1 if !c! geq 1 set "board_!r!_!c!=!possible!"
)

if "!piece!"=="%bKnight%" (
    REM Same as white knight
    set /a "r=%row%+2"
    set /a "c=%col%+1"
    if !r! leq 8 if !c! leq 8 set "board_!r!_!c!=!possible!"
    set /a "c=%col%-1"
    if !r! leq 8 if !c! geq 1 set "board_!r!_!c!=!possible!"
    
    set /a "r=%row%-2"
    set /a "c=%col%+1"
    if !r! geq 1 if !c! leq 8 set "board_!r!_!c!=!possible!"
    set /a "c=%col%-1"
    if !r! geq 1 if !c! geq 1 set "board_!r!_!c!=!possible!"
)

if "!piece!"=="%wKing%" (
    REM King moves one square in any direction
    for /L %%i in (-1,1,1) do (
        for /L %%j in (-1,1,1) do (
            set /a "r=%row%+%%i"
            set /a "c=%col%+%%j"
            if !r! geq 1 if !r! leq 8 if !c! geq 1 if !c! leq 8 set "board_!r!_!c!=!possible!"
        )
    )
)

if "!piece!"=="%bKing%" (
    REM Same as white king
    for /L %%i in (-1,1,1) do (
        for /L %%j in (-1,1,1) do (
            set /a "r=%row%+%%i"
            set /a "c=%col%+%%j"
            if !r! geq 1 if !r! leq 8 if !c! geq 1 if !c! leq 8 set "board_!r!_!c!=!possible!"
        )
    )
)

if "!piece!"=="%wQueen%" (
    REM Queen moves like rook and bishop combined
    for /L %%i in (1,1,8) do (
        if not %%i==%row% set "board_%%i_%col%=!possible!"
        if not %%i==%col% set "board_%row%_%%i=!possible!"
        set /a "r=%row%+%%i-4"
        set /a "c=%col%+%%i-4"
        if !r! geq 1 if !r! leq 8 if !c! geq 1 if !c! leq 8 set "board_!r!_!c!=!possible!"
    )
)

if "!piece!"=="%bQueen%" (
    REM Same as white queen
    for /L %%i in (1,1,8) do (
        if not %%i==%row% set "board_%%i_%col%=!possible!"
        if not %%i==%col% set "board_%row%_%%i=!possible!"
        set /a "r=%row%+%%i-4"
        set /a "c=%col%+%%i-4"
        if !r! geq 1 if !r! leq 8 if !c! geq 1 if !c! leq 8 set "board_!r!_!c!=!possible!"
    )
)
REM -------------------------------------------

goto gameLoop