@echo off
setlocal

rem ---------------------------------------------------------------------------
rem Create Neovim configuration that sources the existing vimrc
rem ---------------------------------------------------------------------------

set "CONFIG_DIR=%LOCALAPPDATA%\nvim"
set "SCRIPT_DIR=%~dp0"
set "SRC_INIT=%SCRIPT_DIR%init.lua"
set "DST_INIT=%CONFIG_DIR%\init.lua"

if not exist "%CONFIG_DIR%" mkdir "%CONFIG_DIR%"

echo Overwriting init.lua...
pause

rem ---------------------------------------------------------------------------
rem Write header line (source vimrc) literally
rem Use double %% to prevent environment variable expansion
rem ---------------------------------------------------------------------------
> "%DST_INIT%" echo local _vimrc = vim.fn.expand('$USERPROFILE/vimfiles/vimrc')
>> "%DST_INIT%" echo if vim.fn.filereadable(_vimrc) == 1 then
>> "%DST_INIT%" echo   vim.cmd('source ' .. vim.fn.fnameescape(_vimrc))
>> "%DST_INIT%" echo end


rem ---------------------------------------------------------------------------
rem Append local init.lua content
rem ---------------------------------------------------------------------------
if exist "%SRC_INIT%" (
    type "%SRC_INIT%" >> "%DST_INIT%"
) else (
    echo Warning: local init.lua not found at "%SRC_INIT%"
)

echo.
echo Successfully wrote %DST_INIT%
echo Run :NeovideRegisterRightClick within Neovide
pause
endlocal

