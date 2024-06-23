@echo Welcome to GBTCPL11! This is still in beta and things may change.
@echo also plz click yes on every dialog window that will pop up.
@echo if you get an access denied error, replace "USERNAME" with your acutal Windows username.
@echo made by idkwhereisthisname :3
@echo Restoring the classic personalization settings...
cd personalizationcpl
ADD.REG
@echo Restoring the classic notification area icons settings...
cd ..
cd NOTIFCPL
ADD.REG
@echo credits to me (i made this) :3
@echo Restoring the classic color settings...
cd ..
cd COLORCPL
ADD.REG
@echo credits to winaero :3
@echo Restoring classic user accounts (netplwiz)
cd ..
cd ACCCPL
ADD.REG
@echo credits to winaero :3 (again)
:: here starts the display options restore
@echo Restoring the classic Display settings (also restores the links)
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
icacls "%SYSTEMROOT%\System32\en-US"\Display.dll.mui /grant USERNAME:F
ren %SYSTEMROOT%\System32\en-US\Display.dll.mui Displayold.dll.mui
cd %USERPROFILE%\Downloads\GBTCPL11-main\displaycpl\DLL
xcopy %USERPROFILE%\Downloads\GBTCPL11-main\DISPLAYCPL\DLL\Display.dll.mui %SYSTEMROOT%\System32\en-US
cd %USERPROFILE%\Downloads\GBTCPL11-main\DISPLAYCPL\REG
ADD.REG
cd %SYSTEMROOT%\SystemResources
taskkill /f /im explorer.exe
takeown /f %SYSTEMROOT%\SystemResources\Shell32.dll.mun
icacls "%SYSTEMROOT%\SystemResources\Shell32.dll.mun" /grant USERNAME:F
ren %SYSTEMROOT%\SystemResources\Shell32.dll.mun Shell32old.dll.mun
cd %USERPROFILE%\Downloads\GBTCPL11-main\DISPLAYCPL\SHELL32\
xcopy %USERPROFILE%\Downloads\GBTCPL11-main\DISPLAYCPL\SHELL32\shell32.dll.mun %SYSTEMROOT%\SystemResources
cd ..
cd %SYSTEMROOT%\System32\en-US
:: i wanted to put the entire directory to avoid confusion lol
takeown /f %SYSTEMROOT%\System32\en-US\shell32.dll.mui
icacls "%SYSTEMROOT%\System32\en-US\shell32.dll.mui" /grant USERNAME:F
ren %SYSTEMROOT%\System32\en-US\shell32.dll.mui shell32old.dll.mui
cd %USERPROFILE%\Downloads\GBTCPL11-main\DISPLAYCPL\SHELL32
xcopy %USERPROFILE%\Downloads\GBTCPL11-main\DISPLAYCPL\SHELL32\shell32.dll.mui %SYSTEMROOT%\System32\en-US\
reg add HKEY_CLASSES_ROOT\CLSID\{C555438B-3C23-4769-A71F-B6D3D9B6053A}\Instance\InitPropertyBag /v ResourceDLL /t REG_EXPAND_SZ /d %SYSTEMROOT%\System32\Display.dll
reg add HKEY_CLASSES_ROOT\CLSID\{C555438B-3C23-4769-A71F-B6D3D9B6053A}\Instance\InitPropertyBag /v ResourceID /t REG_DWORD /d 65
@echo Restarting explorer.exe
explorer
@echo Done. Exiting...
exit
:: to do
:: cleanup the code (ex. if youre in the windows folder, from cd %SYSTEMROOT%\Windows\System32 to cd System32