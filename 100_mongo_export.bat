setlocal enabledelayedexpansion
pushd %~dp0
call setenv.bat

set BACKUP_DIR1=D:\LPMS_backup\backup
pushd %BACKUP_DIR1%

del -y backup_date.txt
del -y documents.json
del -y forms.json
del -y projects.json
del -y users.json
del -y comments.json
del -y emails.json
del -y eml_files.json

echo %YMD% %HMS% > backup_date.txt
mongoexport.exe --uri="mongodb://10.98.84.13:27020/lpms"  --jsonArray --collection=documents --out=documents.json
mongoexport.exe --uri="mongodb://10.98.84.13:27020/lpms"  --jsonArray --collection=forms     --out=forms.json
mongoexport.exe --uri="mongodb://10.98.84.13:27020/lpms"  --jsonArray --collection=projects  --out=projects.json
mongoexport.exe --uri="mongodb://10.98.84.13:27020/lpms"  --jsonArray --collection=users     --out=users.json
mongoexport.exe --uri="mongodb://10.98.84.13:27020/lpms"  --jsonArray --collection=comments  --out=comments.json
mongoexport.exe --uri="mongodb://10.98.84.13:27020/lpms"  --jsonArray --collection=emails    --out=emails.json
mongoexport.exe --uri="mongodb://10.98.84.13:27020/lpms"  --jsonArray --collection=eml_files --out=eml_files.json
rem pause

call powershell Compress-Archive ^
     -Force -Path ^
     .\documents.json,^
     .\forms.json,^
     .\projects.json,^
     .\users.json,^
     .\comments.json ^
     .\emails.json ^
     .\eml_files.json ^
     -DestinationPath ^
     .\archived\LPMS_collection_%YMD%_%HMS%.zip

popd
rem pause
