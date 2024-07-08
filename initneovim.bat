@echo off
REM Create the necessary Neovim config directory structure
set "CONFIG_DIR=%LOCALAPPDATA%\nvim"
if not exist "%CONFIG_DIR%" (
    mkdir "%CONFIG_DIR%"
)

REM Create the init.vim file with the required content
set "INIT_VIM=%CONFIG_DIR%\init.vim"
(
echo source %HOMEDRIVE%%HOMEPATH%\vimfiles\vimrc
) > "%INIT_VIM%"
