setlocal enabledelayedexpansion
pushd %~dp0
call setenv.bat

set LPMS_DB_DIR=D:\Git\lpms-db

pushd       %LPMS_DB_DIR%
git config --global http.proxy http://proxy.sgp.fujixerox.com:8000
git push https://%GIT_TOKEN%:x-oauth-basic@github.com/localization-3g/lpms-db.git
popd

rem pause 