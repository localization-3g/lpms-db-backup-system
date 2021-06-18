setlocal enabledelayedexpansion
pushd %~dp0
call setenv.bat

set LPMS_DB_DIR=D:\Git\lpms-db

pushd       %LPMS_DB_DIR%

set COMMIT_COMMENT="auto update:%YMD% %HMS%"

git config --global http.proxy http://proxy.sgp.fujixerox.com:8000
git add . 
git commit -m %COMMIT_COMMENT%

popd

rem pause 