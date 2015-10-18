set basePath=..\..
set buildConf=release

rm "Files\FusionCLI.exe"
rm "Files\FusionLauncher.exe"
rm "Files\FusionUpdater.exe"
rm "Files\LibFusion.dll"
rm "Files\FusionLang_de.qm"
rm "Files\FusionLang_es.qm"
rm "Files\dbUpdate"

copy "%basePath%\FusionCLI\%buildConf%\FusionCLI.exe" "Files\FusionCLI.exe"

copy "%basePath%\FusionClient\%buildConf%\FusionClient.exe" "Files\FusionLauncher.exe"
copy "%basePath%\FusionClient\FusionLang_de.qm" "Files\FusionLang_de.qm"
copy "%basePath%\FusionClient\FusionLang_es.qm" "Files\FusionLang_es.qm"
copy "%basePath%\FusionClient\dbUpdate" "Files\dbUpdate"

copy "%basePath%\FusionUpdater\%buildConf%\FusionUppdater.exe" "Files\FusionUpdater.exe"

copy "%basePath%\LibFusion\%buildConf%\LibFusion.dll" "Files\LibFusion.dll"

pause