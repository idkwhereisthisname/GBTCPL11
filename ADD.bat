@echo Welcome to GBTCPL11! This is still in beta and things may change.
@echo also plz click yes on every dialog window that will pop up.
@echo for now, the displaycpl cannot be restored.
@echo if you get an invalid directory error, change the directory from "your-locale" to your system language, ex. from %SYSTEMROOT%\your-locale to %SYSTEMROOT%\en-US
@echo Restoring the classic personalization settings...
cd personalizationcpl
ADD.REG
@echo Restoring the classic notification area icons settings...
cd ..
cd NOTIFCPL
ADD.REG
@echo Restoring the classic color settings...
cd ..
cd COLORCPL
ADD.REG
:: here starts the display options restore
@echo Restoring the classic Display settings (also restores the links)
cd %SYSTEMROOT%\System32
@echo Taking ownership of Display.dll...
takeown /f %SYSTEMROOT%\System32\Display.dll
ren %SYSTEMROOT%\System32\Display.dll Displayold.dll
cd %USERPROFILE%\Downloads\GBTCPL11\GBTCPL11-main\DISPLAYCPL\DLL
xcopy %USERPROFILE%\Downloads\GBTCPL11\GBTCPL11-main\DISPLAYCPL\DLL\Display.dll %SYSTEMROOT%\System32\
cd %SYSTEMROOT%\System32\your-locale\
@echo Taking ownership of Display.dll.mui...
takeown /f %SYSTEMROOT%\System32\your-locale\Display.dll.mui
ren %SYSTEMROOT%\System32\your-locale\Display.dll.mui Displayold.dll.mui
cd %USERPROFILE%\Downloads\GBTCPL11\GBTCPL11-main\displaycpl\DLL
xcopy %USERPROFILE%\Downloads\DISPLAYCPL\DLL\Display.dll.mui %SYSTEMROOT%\System32\your-locale
cd %USERPROFILE%\Downloads\GBTCPL11\GBTCPL11-main\DISPLAYCPL\REG
ADD.REG
cd %SYSTEMROOT%\SystemResources
@echo Taking ownership of shell32.dll.mun...
takeown /f %SYSTEMROOT%\SystemResources\shell32.dll.mun
ren %SYSTEMROOT%\SystemResources\Shell32.dll.mun Shell32old.dll.mun
cd %USERPROFILE%\Downloads\GBTCPL11\GBTCPL11-main\DISPLAYCPL\SHELL32\
xcopy %USERPROFILE%\Downloads\GBTCPL11\GBTCPL11-main\DISPLAYCPL\SHELL32\Shell32.dll.mun %SYSTEMROOT%\SystemResources
cd ..
cd %SYSTEMROOT%\System32\your-locale
:: i wanted to put the entire directory to avoid confusion lol
takeown /f %SYSTEMROOT%\System32\your-locale\Shell32.dll.mui
ren %SYSTEMROOT%\System32\your-locale\Shell32.dll.mui Shell32old.dll.mui
cd %USERPROFILE%\Downloads\GBTCPL11\GBTCPL11-main\SHELL32
xcopy %USERPROFILE%\Downloads\GBTCPL11\GBTCPL11-main\DISPLAYCPL\SHELL32\Shell32.dll.mui %SYSTEMROOT%\System32\your-locale\
reg add HKEY_CLASSES_ROOT\CLSID\{C555438B-3C23-4769-A71F-B6D3D9B6053A}\Instance\InitPropertyBag /v ResourceDLL /t REG_EXPAND_SZ /d %SYSTEMROOT%\System32\Display.dll
reg add HKEY_CLASSES_ROOT\CLSID\{C555438B-3C23-4769-A71F-B6D3D9B6053A}\Instance\InitPropertyBag /v ResourceID /t REG_DWORD /d 65
@echo Restarting explorer.exe
@taskkill /f /im explorer.exe
@explorer
@echo Done. Exiting...
exit