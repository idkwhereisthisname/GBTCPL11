this small tool restores (almost) all of the control panel settings on Windows 11

## !IMPORTANT NOTICE!

Restoring the Display options will only work on your locale! For example, if my locale is it-IT, it wont work for me if i set it to en-US, so you have to replace the language in the bat file matching your pc language.

also no harm should be done to your pc, though i am not responsible for any damage.

another thing, you should take ownership of the HKEY_CLASSES_ROOT\CLSID\{C555438B-3C23-4769-A71F-B6D3D9B6053A} folder, to do so, right click, authorizations, advanced, owner should 

be ```TrustedInstaller```, click change, type your user, select all the checkmarks, press ok, click the full access box, press ok, exit regedit, and youre good to go!, or you can run the script as [TrustedInstaller](https://winaero.com/download-execti-run-as-trustedinstaller/)

to get access to the system/about page in the control panel, use [ExplorerPatcher](https://github.com/valinet/ExplorerPatcher)

one last thing, the folder has be saved in the downloads folder for it to work. and do not rename anything.

## what i can't get to work

taskbar properties/navigation properties

default programs page

testers are always welcome (i cant get a vm because my pc only has 8gb of ram).
