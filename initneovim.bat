@echo off
REM Create the necessary Neovim config directory structure
set "CONFIG_DIR=%LOCALAPPDATA%\nvim"
if not exist "%CONFIG_DIR%" (
    mkdir "%CONFIG_DIR%"
)
echo "Overwriting init.vim..."
pause
REM Create the init.vim file with the required content
set "INIT_VIM=%CONFIG_DIR%\init.vim"
(
echo source %HOMEDRIVE%%HOMEPATH%\vimfiles\vimrc
) > "%INIT_VIM%"
echo Run :NeovideRegisterRightClick within Neovide
