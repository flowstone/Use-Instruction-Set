@echo off
echo ---- ��������:ɾ��Eclipse����MavenԶ�ֿ̲�jarʧ�ܵĻ����ļ� ----
echo ---- create by Simon -------------------------------------------
echo ---- ����ʱ�䣺2017-10-30 --------------------------------------

  
echo ---- ����Maven�ֿ�ı��ص�ַ -----------------------------------
set REPOSITORY_PATH=%M2_HOME%\repository
echo ---- ����ɾ����ʼ... ----
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
echo ---- ����ɾ������ ----
echo ---- ллʹ��! ----
pause