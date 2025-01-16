REM Mostrar posibles movimientos por cada ficha

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