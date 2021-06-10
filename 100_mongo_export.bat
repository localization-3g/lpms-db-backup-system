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

echo %YMD% %HMS% > backup_date.txt
mongoexport.exe --uri="mongodb://10.98.84.13:27020/lpms"  --jsonArray --collection=documents --out=documents.json
mongoexport.exe --uri="mongodb://10.98.84.13:27020/lpms"  --jsonArray --collection=forms     --out=forms.json
mongoexport.exe --uri="mongodb://10.98.84.13:27020/lpms"  --jsonArray --collection=projects  --out=projects.json
mongoexport.exe --uri="mongodb://10.98.84.13:27020/lpms"  --jsonArray --collection=users     --out=users.json

copy documents.json   .\archived\%YMD%_documents.json
copy forms.json       .\archived\%YMD%_forms.json
copy projects.json    .\archived\%YMD%_projects.json
copy users.json       .\archived\%YMD%_users.json

popd
rem pause
