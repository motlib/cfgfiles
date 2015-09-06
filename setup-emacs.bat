REM
REM Copy emacs settings to their system location (batch file obviously
REM for windows systems).
REM

set DIR=%~dp0

@echo Copying emacs configuration to %APPDATA%.
@cp %DIR%/.emacs %APPDATA%
@cp -a %DIR%/.emacs.d %APPDATA%
