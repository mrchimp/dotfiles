@Echo off
"C:\Program Files\MapInfo\MapBasic\Mapbasic.exe" -NOSPLASH -L ""%1""
if exist ""%1.err"" type ""%1.err""
