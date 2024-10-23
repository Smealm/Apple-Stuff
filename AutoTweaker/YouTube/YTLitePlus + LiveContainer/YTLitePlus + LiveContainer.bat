cls

:: Download Params

:: A suprise tool that will help us later
set "CurrentDir=%CD%"

:: YTLitePlus DDL
set DDL_IPA="https://files.catbox.moe/z8jg5n.ipa"

:: Name of app (do not use quotations or it will break the script)
set Name_IPA=YTLitePlus

:: YTlitePlus Version
set Ver_IPA="v19.34.2-5.0.1"

:: File type
set FileType_DDL="zip"

:: --------------------------------------------------------------------------------------------
cls

:: Tweaks / Patches Params

rem the location in the app where the changes are occuring
set Tweak_Dir="Youtube.app\Frameworks"

:: --------------------------------------------------------------------------------------------
cls

:: Preparing File for changes

:: Cleans up background command text
@echo off

curl.exe -fSLo "%Name_IPA%-%Ver_IPA%.%FileType_DDL%" "%DDL_IPA%"

powershell Expand-Archive -force "%Name_IPA%-%Ver_IPA%.%FileType_DDL%"

del "%Name_IPA%-%Ver_IPA%.%FileType_DDL%"

cd "%Name_IPA%-%Ver_IPA%\payload\%Tweak_Dir%"

:: --------------------------------------------------------------------------------------------
cls


:: Make your changes here

del YouPiP.dylib
del YouTubeDislikesReturn.dylib

echo. > YouPiP.dylib
echo. > YouTubeDislikesReturn.dylib

:: --------------------------------------------------------------------------------------------
cls

:: Repackage IPA and cleanup leftovers

cd /d "%CurrentDir%\%Name_IPA%-%Ver_IPA%"

powershell Compress-Archive -Path '%CurrentDir%\%Name_IPA%-%Ver_IPA%\Payload' -DestinationPath '%CurrentDir%\%Name_IPA%-%Ver_IPA%.zip' -Force

rename "%CurrentDir%\%Name_IPA%-%Ver_IPA%.zip" "%Name_IPA%-%Ver_IPA%.ipa"

cd "%CurrentDir%"

rmdir /s /q "%Name_IPA%-%Ver_IPA%"
