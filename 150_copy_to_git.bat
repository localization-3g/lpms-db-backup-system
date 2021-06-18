setlocal enabledelayedexpansion
pushd %~dp0
call setenv.bat

set BACKUP_DIR1=D:\LPMS_backup\backup
set BACKUP_DIR2=D:\Git\lpms-db\backup
pushd %BACKUP_DIR1%


copy backup_date.txt  %BACKUP_DIR2%\backup_date.txt
copy *.json   %BACKUP_DIR2%\

popd
rem pause