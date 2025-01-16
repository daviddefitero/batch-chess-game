@echo off
setlocal EnableDelayedExpansion
chcp 65001

REM Llama a los componentes del juego
call .\components\Menu.bat
call .\components\Game.bat