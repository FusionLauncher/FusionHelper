# FusionHelper
This Repo will contain some Script and Tools.

## NSIS Installer-Script
In the same Folder as the Script, create a directory called "Files", which contains all the required Files.
At this moment it has to look like this:
```
│   Fusion.ico
│   FusionCLI.exe
│   FusionUpdater.exe
│   libgcc_s_dw2-1.dll
│   libstdc++-6.dll
│   libwinpthread-1.dll
│   qt.conf
│   Qt5Core.dll
│   Qt5Gui.dll
│   Qt5Network.dll
│   Qt5Sql.dll
│   Qt5Widgets.dll
│
└───plugins
    ├───platforms
    │       qwindows.dll
    │
    └───sqldrivers
            qsqlite.dll
```

The basic Files and Folder-Structure is already added.
You can find the qt-DLLs in your QT-Folder, hit search in C:\QT or wherever you have installed it.
Please note that you have to create a release-build.

## Doxyfile
In order to generate the Documentation, please following folder-structure:
```
| Project Fusion
|───FusionCLI
|   ├───...
|───FusionClient
|   ├───...
|───FusionKodiPlugin
|   ├───...
|───FusionUpdater
|   ├───..
|───FusionHelper
|   ├───Documentation
|   ├───Doxygen
|   │   ├───Doxyfile
```
Launch the Doxyfile from within its directory, it will use relative paths.
