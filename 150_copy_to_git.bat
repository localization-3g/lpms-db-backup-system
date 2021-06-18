setlocal enabledelayedexpansion
pushd %~dp0
call setenv.bat

set IMPORT_DIR=D:\Git\lpms-db\backup
set BACKUP_DIR1=D:\LPMS_backup\backup
pushd %BACKUP_DIR1%


copy backup_date.txt  %IMPORT_DIR%\backup_date.txt
copy *.json   %IMPORT_DIR%\

popd
rem pause