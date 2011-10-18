@Echo off

rem "C:\Program Files\MapInfo\MapBasic\MapBasic.exe" -NOSPLASH -D ""%1""
rem if exist ""%1.err"" type ""%1.err""

setlocal ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION
rem Compile_MB.bat
rem This file is used to compile a MapBasic Program Source file from within Notepad++

rem Check that the file is a MapBasic Program Source file
if /i %~x1 NEQ .mb (
        echo Error: file %~dpnx1 is not a MapBasic Program Source file ^(^*.mb^)
        echo.
        rem pause
) else (
        echo Compiling %~dpnx1
        "C:\Program Files\MapInfo\MapBasic\MAPBASIC.EXE" -server -D %1

        if exist "%~dpn1.err" (
                echo Errors in compilation
                echo Press a key to open error log: %~dpn1.err.
                echo.
                rem pause
                "C:\Program Files\Vim\vim73\gvim.exe" --remote-silent "%~dpn1.err"
        )
)