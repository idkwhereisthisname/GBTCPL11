@echo Welcome to GBTCPL11! This is still in beta and things may change.
@echo also plz click yes on every dialog window that will pop up.
@echo if you get an access denied error, replace "USERNAME" with your acutal Windows username.
@echo made by idkwhereisthisname :3
@echo.
@echo Restoring the classic personalization settings...
@echo.
cd personalizationcpl
ADD.REG
@echo.
@echo Restoring the classic notification area icons settings...
@echo.
cd ..
cd NOTIFCPL
ADD.REG
@echo credits to me (i made this) :3
@echo.
@echo Restoring the classic color settings...
@echo.
cd ..
cd COLORCPL
ADD.REG
@echo credits to winaero
@echo.
@echo Restoring classic user accounts (netplwiz)
@echo.
cd ..
cd ACCCPL
ADD.REG
@echo credits to winaero (again)
@echo.
@echo Restoring the classic Windows Update applet... (this is just for decoration, and doesnt acutally update anything.)
@echo.
cd ..
cd WINUPD\
xcopy wucltux.dll %SYSTEMROOT%\System32
cd en-US
xcopy wucltux.dll.mui %SYSTEMROOT%\System32\en-US
cd WINUPD\reg
cd ..
cd reg
WUCLTUX.REG
regsvr32 wucltux.dll
@echo.
@echo Credits to a WinClassic thread (https://winclassic.net/thread/1779/restoring-control-panel-pages-links), i made the remove registry file, though
@echo.
@echo If you want to go further and restore the display applet, please press any key, otherwise, close this window.
@echo.
@timeout -1
@echo Ok, restoring the classic display applet...
: here starts the display options restore
@echo.
cd %SYSTEMROOT%\System32
@echo Taking ownership of Display.dll...
takeown /f Display.dll
icacls Display.dll /grant USERNAME:F
ren %SYSTEMROOT%\System32\Display.dll Displayold.dll
cd %USERPROFILE%\Downloads\GBTCPL11-main\DISPLAYCPL\DLL
xcopy Display.dll %SYSTEMROOT%\System32\
cd %SYSTEMROOT%\System32\en-US\
@echo Taking ownership of Display.dll.mui...
takeown /f Display.dll.mui
icacls "Display.dll.mui" /grant USERNAME:F
ren "Display.dll.mui" "Displayold.dll.mui"
cd %USERPROFILE%\Downloads\GBTCPL11-main\displaycpl\DLL
xcopy Display.dll.mui %SYSTEMROOT%\System32\en-US
cd %USERPROFILE%\Downloads\GBTCPL11-main\DISPLAYCPL\REG
ADD.REG
cd %SYSTEMROOT%\SystemResources
taskkill /f /im explorer.exe
: old method which doesnt work
: takeown /f "%SYSTEMROOT%\SystemResources\Shell32.dll.mun"
: icacls "%SYSTEMROOT%\SystemResources\Shell32.dll.mun" /grant USER:F
: ren "%SYSTEMROOT%\SystemResources\Shell32.dll.mun" "Shell32old.dll.mun"
: cd %USERPROFILE%\Downloads\GBTCPL11-main\DISPLAYCPL\SHELL32
cd %SYSTEMROOT%\SystemResources
takeown /f Shell32.dll.mun
icacls "Shell32.dll.mun" /grant USERNAME:F
ren "Shell32.dll.mun" "Shell32old.dll.mun"
cd %SYSTEMROOT%\System32\en-US
takeown /f Shell32.dll.mui
icacls "Shell32.dll.mui" /grant USERNAME:F
ren Shell32.dll.mui Shell32old.dll.mui
cd %USERPROFILE%\Downloads\GBTCPL11-main\DISPLAYCPL\SHELL32
xcopy "Shell32.dll.mui" "%SYSTEMROOT%\System32\en-US"
reg add HKEY_CLASSES_ROOT\CLSID\{C555438B-3C23-4769-A71F-B6D3D9B6053A}\Instance\InitPropertyBag /v ResourceDLL /t REG_EXPAND_SZ /d %SYSTEMROOT%\System32\Display.dll
reg add HKEY_CLASSES_ROOT\CLSID\{C555438B-3C23-4769-A71F-B6D3D9B6053A}\Instance\InitPropertyBag /v ResourceID /t REG_DWORD /d 65
@echo.
@echo Done! You can now close this window.
@echo.
@explorer