@echo off
cd %~dp0
setlocal
set BUILD_TYPE=32
:start
mkdir .\build%BUILD_TYPE%
for %%j in (0 1) do (
for %%i in (0 1 2 3 4 5 6 7 8 9 A B C D E F) do (
    echo #pragma once > myuuid.h
    echo #define MYUUID "FFA07888-75BD-471A-B325-59274E7340%%j%%i" >> myuuid.h
    "C:\Program Files\Microsoft Visual Studio\2022\Community\MSBuild\Current\Bin\amd64\MSBuild.exe" ExecuteCommand.sln /p:Configuration=Release %MSBUILD_OPT%
    copy .%BUILD_SRCDIR_PREF%\Release\ExecuteCommand.exe .\build%BUILD_TYPE%\ExecuteCommand40%%j%%i.exe
)
)
if %BUILD_TYPE%==64 (
    exit /b
)
set MSBUILD_OPT=/p:Platform=x64
set BUILD_SRCDIR_PREF=\x64
set BUILD_TYPE=64
goto :start
