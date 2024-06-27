@echo Removing GBTCPL11...
@echo click yes on every dialog
@echo made by idkwhereisthisname :3
@echo Removing the classic personalization settings...
cd personalizationcpl
REMOVE.reg
@echo.
@echo credits to winaero
@echo.
@echo Removing the classic notification area icons settings...
cd ..
cd NOTIFCPL
REMOVE.REG
@echo credits to me :3 (i made this)
@echo Removing the classic color settings....
cd ..
cd COLORCPL
REMOVE.REG
@echo.
@echo credits to winaero (again)
@echo.
@echo Removing classic user accounts (netplwiz)...
cd ..
cd acccpl
remove.reg
@echo.
@echo Removing Windows Update applet...
@echo.
cd WINUPD\REG
REMOVE.REG
regsvr32 /u wucltux.dll
del %SYSTEMROOT%\system32\wucltux.dll
cd %SYSTEMROOT%\system32\en-US
del wucltux.dll.mui
:: ok now for the long part...
@echo Reverting the classic display settings...
cd %USERPROFILE%\Downloads\GBTCPL11-main\DISPLAYCPL\REG
REMOVE.reg
taskkill /f /im explorer.exe
cd %SYSTEMROOT%\System32\
@echo Restoring Display.dll and .mui...
del %SYSTEMROOT%\System32\Display.dll
ren %SYSTEMROOT%\System32\Displayold.dll Display.dll
cd %SYSTEMROOT%\en-US
del %SYSTEMROOT%\en-US\Display.dll.mui
ren %SYSTEMROOT%\en-US\Displayold.dll.mui Display.dll.mui
cd %SYSTEMROOT%\SystemResources\
@echo Restoring Shell32.dll.mun and .mui...
del %SYSTEMROOT%\SystemResources\Shell32.dll.mun
ren %SYSTEMROOT%\SystemResources\Shell32old.dll.mun Shell32.dll.mun
cd %SYSTEMROOT%\System32\en-US
del %SYSTEMROOT%\System32\en-US\Shell32.dll.mui
ren %SYSTEMROOT%\System32\en-US\Shell32old.dll.mui Shell32.dll.mui
cd %USERPROFILE%\Downloads\GBTCPL11-main\
@echo Reverting the Registry entries...
reg delete HKEY_CLASSES_ROOT\CLSID\{C555438B-3C23-4769-A71F-B6D3D9B6053A}\Instance\InitPropertyBag /v ResourceDLL
reg delete HKEY_CLASSES_ROOT\CLSID\{C555438B-3C23-4769-A71F-B6D3D9B6053A}\Instance\InitPropertyBag /v ResourceID
@echo Restarting explorer...
@echo Done! You can now close this window.
@explorer