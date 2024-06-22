@echo Removing GBTCPL11...
@echo click yes on every dialog
@echo made by idkwhereisthisname :3
:: change the directory from "your-locale" to your system language, more info in the README.MD
@echo Removing the classic personalization settings...
cd personalizationcpl
:: decided to not call it rem.reg because rem is a command apparently duh
REMOVE.reg
@echo credits to winaero :3
@echo Removing the classic notification area icons settings...
cd ..
cd NOTIFCPL
REMOVE.REG
@echo credits to me :3 (i made this)
@echo Removing the classic color settings....
cd ..
cd COLORCPL
REMOVE.REG
@echo credits to winaero :3 (again)
:: ok now for the long part...
@echo Reverting the classic display settings...
cd ..
cd DISPLAYCPL
cd REG
REMOVE.reg
cd %SYSTEMROOT%\System32\
del %SYSTEMROOT%\System32\Display.dll
ren %SYSTEMROOT%\System32\Displayold.dll Display.dll
cd %SYSTEMROOT%\your-locale
del %SYSTEMROOT%\your-locale\Display.dll.mui
ren %SYSTEMROOT%\Displayold.dll.mui Display.dll.mui
cd %SYSTEMROOT%\SystemResources\
del %SYSTEMROOT%\Shell32.dll.mun
ren %SYSTEMROOT%Shell32old.dll.mun Shell32.dll.mun
cd %SYSTEMROOT%\System32\your-locale
del %SYSTEMROOT%\System32\your-locale\Shell32.dll.mui
ren %SYSTEMROOT%\System32\your-locale\Shell32old.dll.mui shell32.dll.mui
cd %USERPROFILE%\Downloads\GBTCPL11\GBTCPL11-main\
@echo Reverting the Registry entries...
reg delete HKEY_CLASSES_ROOT\CLSID\{C555438B-3C23-4769-A71F-B6D3D9B6053A}\Instance\InitPropertyBag /v ResourceDLL
reg delete HKEY_CLASSES_ROOT\CLSID\{C555438B-3C23-4769-A71F-B6D3D9B6053A}\Instance\InitPropertyBag /v ResourceID
@echo Restarting explorer...
taskkill /f /im explorer.exe
explorer
Done! Exiting....
exit