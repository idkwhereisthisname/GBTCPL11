@echo Removing GBTCPL11...
@echo click yes on every dialog
:: change the directory from "your-locale" to your system language, more info in the README.MD
@echo Removing the classic personalization settings...
cd personalizationcpl
:: decided to not call it rem.reg because rem is a command apparently duh
REMOVE.reg
@echo Removing the classic notification area icons settings...
cd ..
cd NOTIFCPL
REMOVE.REG
@echo Removing the classic color settings....
cd ..
cd COLORCPL
REMOVE.REG
:: ok now for the long part...
@echo Reverting the classic display settings...
cd ..
cd DISPLAYCPL
cd REG
REMOVE.reg
cd %SYSTEMROOT%\system32\
del Display.dll
ren Displayold.dll Display.dll
cd %SYSTEMROOT%\your-locale
del display.dll.mui
ren displayold.dll.mui display.dll.mui
cd %SYSTEMROOT%\SystemResources\
del shell32.dll.mun
ren shell32old.dll.mun shell32.dll.mun
cd %SYSTEMROOT%\System32\your-locale
del shell32.dll.mui
ren shell32old.dll.mui shell32.dll.mui
cd %USERPROFILE%\Downloads\GBTCPL11\
@echo Reverting the Registry entries...
reg add HKEY_CLASSES_ROOT\CLSID\{C555438B-3C23-4769-A71F-B6D3D9B6053A}\Instance\InitPropertyBag /v ResourceDLL
reg delete HKEY_CLASSES_ROOT\CLSID\{C555438B-3C23-4769-A71F-B6D3D9B6053A}\Instance\InitPropertyBag /v ResourceID
@echo Restarting explorer...
taskkill /f /im explorer.exe
explorer
Done! Exiting....
exit