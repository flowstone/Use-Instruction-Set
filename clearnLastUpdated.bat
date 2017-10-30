@echo off
echo ---- 命令作用:删除Eclipse下载Maven远程仓库jar失败的缓存文件 ----
echo ---- create by Simon -------------------------------------------
echo ---- 创建时间：2017-10-30 --------------------------------------

  
echo ---- 这是Maven仓库的本地地址 -----------------------------------
set REPOSITORY_PATH=%M2_HOME%\repository
echo ---- 搜索删除开始... ----
for /f "delims=" %%i in ('dir /b /s "%REPOSITORY_PATH%\*lastUpdated*"') do (
    del /s /q %%i
)
for /f "delims=" %%i in ('dir /b /s "%REPOSITORY_PATH%\aether-*-in-progress"') do (
    del /s /q %%i
)
for /f "delims=" %%i in ('dir /b /s "%REPOSITORY_PATH%\_remote.repositories"') do (
    del /s /q %%i
)
for /f "delims=" %%i in ('dir /b /s "%REPOSITORY_PATH%\_maven.repositories"') do (
    del /s /q %%i
)
for /f "delims=" %%i in ('dir /b /s "%REPOSITORY_PATH%\maven-metadata-nexus*"') do (
    del /s /q %%i
)
for /f "delims=" %%i in ('dir /b /s "%REPOSITORY_PATH%\resolver-status*"') do (
    del /s /q %%i
)
echo ---- 搜索删除结束 ----
echo ---- 谢谢使用! ----
pause