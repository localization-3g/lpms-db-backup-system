setlocal enabledelayedexpansion
pushd %~dp0
call setenv.bat

call 300_pull_git.bat
call 100_mongo_export.bat
call 150_copy_to_git.bat
call 400_commit_git.bat
call 500_push_git.bat

rem pause 