rem ###########################################################
rem #### PY 27
rem ###########################################################
%PY27_64_CONDA%\Scripts\pip install autopep8 --upgrade
%PY27_64_CONDA%\Scripts\pip install flake8 --upgrade
%PY27_64_CONDA%\Scripts\pip install jedi --upgrade
%PY27_64_CONDA%\Scripts\pip install neovim --upgrade
%PY27_64_CONDA%\Scripts\pip install pynvim --upgrade

rem %PY27_64_CONDA%\Scripts\pip install ipdb --upgrade
rem %PY27_64_CONDA%\Scripts\pip install pylint==1.9.4 --upgrade

setlocal

SET PATH=%PATH%;%PY37_64_CONDA%\Library\bin\;

rem ###########################################################
rem #### PY 37
rem ###########################################################
%PY37_64_CONDA%\Scripts\pip install autopep8 --upgrade
%PY37_64_CONDA%\Scripts\pip install flake8 --upgrade
%PY37_64_CONDA%\Scripts\pip install jedi --upgrade
%PY37_64_CONDA%\Scripts\pip install neovim --upgrade
%PY37_64_CONDA%\Scripts\pip install pynvim --upgrade
%PY37_64_CONDA%\Scripts\pip install psutil --upgrade

endlocal

rem %PY37_64_CONDA%\Scripts\pip install ipdb --upgrade
rem %PY37_64_CONDA%\Scripts\pip install pylint --upgrade
