rem @echo off
set curdir=%~dp0%
call %curdir%setenv.bat

REM === parameter ============================================================
set COPY_OPT=E

set active_log=\\nbserver1\tr-shiga_backup\backup_log\%Year%%Month%%Day%_%Hour%%Min%%Sec%_backup_1000.log
set active_dir_in=F:\prod\lpms\server\public
set active_dir_ou=\\nbserver1\tr-shiga_backup\f\prod\lpms\server\public
call :copy_main

REM === Volume Info ============================================================
echo "C:\" >> %active_log%
dir C:\ | findstr "bytes" | findstr "free"  >> %active_log%
echo "D:\" >> %active_log%
dir D:\ | findstr "bytes" | findstr "free"  >> %active_log%
echo "F:\" >> %active_log%
dir F:\ | findstr "bytes" | findstr "free"  >> %active_log%
                                                                      
:EXIT9999
exit /b

REM ===  ROBOCOPY ============================================================
:copy_main
robocopy %active_dir_in% %active_dir_ou% /xd "System Volume Information" "$RECYCLE.BIN" /%COPY_OPT% /COPY:DT /R:0 /W:1 /LOG:%active_log% /NP /NDL /TEE 

exit /b
