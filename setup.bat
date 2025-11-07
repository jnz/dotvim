@echo off
REM Create the necessary Neovim config directory structure
set "CONFIG_DIR=%LOCALAPPDATA%\nvim"
if not exist "%CONFIG_DIR%" (
    mkdir "%CONFIG_DIR%"
)

echo Overwriting init.lua...
pause

REM Paths
set "SCRIPT_DIR=%~dp0"
set "INIT_LUA_SRC=%SCRIPT_DIR%init.lua"
set "INIT_LUA_DST=%CONFIG_DIR%\init.lua"

REM Create/overwrite destination file with the vimrc source line
(
    echo vim.cmd('source %%HOMEDRIVE%%%%HOMEPATH%%\\vimfiles\\vimrc')
) > "%INIT_LUA_DST%"

REM Append the local init.lua contents
type "%INIT_LUA_SRC%" >> "%INIT_LUA_DST%"

echo.
echo Successfully wrote %INIT_LUA_DST%
echo Run :NeovideRegisterRightClick within Neovide
pause

