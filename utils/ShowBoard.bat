REM Mstrar tablero
echo    A   B   C   D   E   F   G   H
echo  +---+---+---+---+---+---+---+---+
for /L %%i in (8,-1,1) do (
    set "line=%%i"
    set "displayLine=!line! |"
    for /L %%j in (1,1,8) do (
        set "displayLine=!displayLine!!board_%%i_%%j!|"
    )
    echo !displayLine!
    echo  +---+---+---+---+---+---+---+---+
)