@echo off

setlocal
pushd %~dp0

call start_setup.cmd
copy %NEOVIM%\bin\nvim-qt.exe %NEOVIM%\bin\nvim-qt-left.exe
copy %NEOVIM%\bin\nvim-qt.exe %NEOVIM%\bin\nvim-qt-right.exe

popd
endlocal
