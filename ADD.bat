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
cd %USERPROFILE%\Downloads\GBTCPL11-main\WINUPD\
xcopy %USERPROFILE%\Downloads\GBTCPL11-main\WINUPD\wucltux.dll %SYSTEMROOT%\System32
xcopy %USERPROFILE%\Downloads\GBTCPL11-main\WINUPD\en-US\wucltux.dll.mui %SYSTEMROOT%\System32\en-US
cd %USERPROFILE%\downloads\gbtcpl11-main\WINUPD\reg
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
takeown /f %SYSTEMROOT%\System32\Display.dll
icacls "%SYSTEMROOT%\System32\Display.dll" /grant USERNAME:F
ren %SYSTEMROOT%\System32\Display.dll Displayold.dll
cd %USERPROFILE%\Downloads\GBTCPL11-main\DISPLAYCPL\DLL
xcopy %USERPROFILE%\Downloads\GBTCPL11-main\DISPLAYCPL\DLL\Display.dll %SYSTEMROOT%\System32\
cd %SYSTEMROOT%\System32\en-US\
@echo Taking ownership of Display.dll.mui...
takeown /f %SYSTEMROOT%\System32\en-US\Display.dll.mui
icacls "%SYSTEMROOT%\System32\en-US\Display.dll.mui" /grant USERNAME:F
ren %SYSTEMROOT%\System32\en-US\Display.dll.mui Displayold.dll.mui
cd %USERPROFILE%\Downloads\GBTCPL11-main\displaycpl\DLL
xcopy %USERPROFILE%\Downloads\GBTCPL11-main\DISPLAYCPL\DLL\Display.dll.mui %SYSTEMROOT%\System32\en-US
cd %USERPROFILE%\Downloads\GBTCPL11-main\DISPLAYCPL\REG
ADD.REG
cd %SYSTEMROOT%\SystemResources
taskkill /f /im explorer.exe
: old method which doesnt work
: takeown /f "%SYSTEMROOT%\SystemResources\Shell32.dll.mun"
: icacls "%SYSTEMROOT%\SystemResources\Shell32.dll.mun" /grant USER:F
: ren "%SYSTEMROOT%\SystemResources\Shell32.dll.mun" "Shell32old.dll.mun"
: cd %USERPROFILE%\Downloads\GBTCPL11-main\DISPLAYCPL\SHELL32
takeown /f %SYSTEMROOT%\SystemResources
icacls "%SYSTEMROOT%\SystemResources" /grant USERNAME:F
xcopy "%USERPROFILE%\Downloads\GBTCPL11-main\DISPLAYCPL\SHELL32\shell32.dll.mun" %SYSTEMROOT%\SystemResources
: also old method which doesnt work
: cd %SYSTEMROOT%\System32\en-su
: takeown /f %SYSTEMROOT%\System32\en-su\shell32.dll.mui
: icacls "%SYSTEMROOT%\System32\en-su\shell32.dll.mui" /grant USER:F
takeown /f %SYSTEMROOT%\System32\en-US\
icacls "%SYSTEMROOT%\System32\en-US" /grant USERNAME:F
ren %SYSTEMROOT%\System32\en-US\shell32.dll.mui shell32old.dll.mui
cd %USERPROFILE%\Downloads\GBTCPL11-main\DISPLAYCPL\SHELL32
xcopy %USERPROFILE%\Downloads\GBTCPL11-main\DISPLAYCPL\SHELL32\shell32.dll.mui %SYSTEMROOT%\System32\en-US\
reg add HKEY_CLASSES_ROOT\CLSID\{C555438B-3C23-4769-A71F-B6D3D9B6053A}\Instance\InitPropertyBag /v ResourceDLL /t REG_EXPAND_SZ /d %SYSTEMROOT%\System32\Display.dll
reg add HKEY_CLASSES_ROOT\CLSID\{C555438B-3C23-4769-A71F-B6D3D9B6053A}\Instance\InitPropertyBag /v ResourceID /t REG_DWORD /d 65
@echo Done! You can now close this window.
@explorer
: to do
: cleanup the code (ex. if youre in the windows folder, from cd %SYSTEMROOT%\Windows\System32 to cd System32
