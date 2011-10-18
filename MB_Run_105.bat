@Echo off
rem "C:\Program Files\MapInfo\Professional\MapInfow.exe" -NOSPLASH -D ""%1""
rem if exist ""%1.err"" type ""%1.err""

setlocal ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION
rem Run_MBX.bat
rem This file is used to run a MapBasic Application from within Notepad++

rem Check that the current file is a MapBasic Program Source file
if /i %~x1 NEQ .mb (
    echo Error: file %~dpnx1 is not a MapBasic Program Source file ^(^*.mb^)
    echo.
    rem pause
) else (
    if not exist "%~dpn1.mbx" (
        echo Error: file %~dpn1.mbx does not exist
        echo You have to compile the file before you can run it
        echo.
        rem pause
	) else (
		"%~dpn1.mbx"
	)
)
