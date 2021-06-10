setlocal enabledelayedexpansion
pushd %~dp0
call setenv.bat

set IMPORT_DIR=D:\Git\lpms-db\import
set BACKUP_DIR1=D:\LPMS_backup\backup
pushd %BACKUP_DIR1%


copy backup_date.txt  %IMPORT_DIR%\backup_date.txt
copy documents.json   %IMPORT_DIR%\documents.json
copy forms.json       %IMPORT_DIR%\forms.json
copy projects.json    %IMPORT_DIR%\projects.json
copy users.json       %IMPORT_DIR%\users.json

popd
rem pause