@echo off

echo ###########################################################
echo #### PY27_64_CONDA
echo ###########################################################
%PY27_64_CONDA%\Scripts\pip install autopep8 --upgrade
%PY27_64_CONDA%\Scripts\pip install flake8 --upgrade
%PY27_64_CONDA%\Scripts\pip install jedi --upgrade
%PY27_64_CONDA%\Scripts\pip install neovim --upgrade
%PY27_64_CONDA%\Scripts\pip install pynvim --upgrade
%PY27_64_CONDA%\Scripts\pip install psutil --upgrade

setlocal

SET PATH=%PATH%;%PY3_CONDA%\Library\bin\;

echo ###########################################################
echo #### PY3_CONDA
echo ###########################################################
%PY3_CONDA%\Scripts\pip install autopep8 --upgrade
%PY3_CONDA%\Scripts\pip install flake8 --upgrade
%PY3_CONDA%\Scripts\pip install jedi --upgrade
%PY3_CONDA%\Scripts\pip install neovim --upgrade
%PY3_CONDA%\Scripts\pip install pynvim --upgrade
%PY3_CONDA%\Scripts\pip install psutil --upgrade

endlocal
