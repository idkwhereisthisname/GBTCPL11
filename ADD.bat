@echo Welcome to GBTCPL11! This is still in beta and things may change.
@echo also plz click yes on every dialog window that will pop up.
@echo for now, the displaycpl cannot be restored.
:: change the directory from "your-locale" to your system language, ex. from %SYSTEMROOT%\your-locale to %SYSTEMROOT%\en-US
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
@echo Restoring the classic Display settings (also restores the links)
cd %SYSTEMROOT%\System32
takeown /f display.dll
ren display.dll displayold.dll
cd %USERPROFILE%\Downloads\GBTCPL11\displaycpl\dll
xcopy Display.dll C:\Windows\System32\
cd C:\Windows\your-locale\
takeown /f Display.dll.mui
ren Display.dll.mui Displayold.dll.mui
cd %USERPROFILE%\Downloads\GBTCPL11\displaycpl\DLL
xcopy Display.dll.mui C:\Windows\your-locale
cd %USERPROFILE%\Downloads\GBTCPL11\DISPLAYCPL\REG
ADD.REG
cd %SYSTEMROOT%\SystemResources
takeown /f shell32.dll.mun
ren shell32.dll.mun shell32old.dll.mun
cd %USERPROFILE%\Downloads\GBTCPL11\DISPLAYCPL\SHELL32\
xcopy shell32.dll.mun %SYSTEMROOT%\SystemResources
cd ..
cd %SYSTEMROOT%\System32\your-locale
:: i wanted to put the entire directory to avoid confusion lol
takeown /f shell32.dll.mui
ren shell32.dll.mui shell32old.dll.mui
cd %USERPROFILE%\Downloads\GBTCPL11\SHELL32\
xcopy shell32.dll.mui %SYSTEMROOT%\System32\your-locale\
reg add HKEY_CLASSES_ROOT\CLSID\{C555438B-3C23-4769-A71F-B6D3D9B6053A}\Instance\InitPropertyBag /v ResourceDLL /t REG_EXPAND_SZ /d %SYSTEMROOT%\System32\Display.dll
reg add HKEY_CLASSES_ROOT\CLSID\{C555438B-3C23-4769-A71F-B6D3D9B6053A}\Instance\InitPropertyBag /v ResourceID /t REG_DWORD /d 65
@echo Restarting explorer.exe
@taskkill /f /im explorer.exe
@explorer
@echo Done. Exiting...
exit