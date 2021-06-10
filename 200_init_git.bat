setlocal enabledelayedexpansion
pushd %~dp0
call setenv.bat

set LPMS_DB_DIR=D:\Git\lpms-db

rmdir -s -q %LPMS_DB_DIR%
pushd  D:\Git

git config --global http.proxy http://proxy.sgp.fujixerox.com:8000
git clone https://%GIT_TOKEN%:x-oauth-basic@github.com/localization-3g/lpms-db.git
rem git clone https://github.com/localization-3g/lpms-db.git

popd
rem pause