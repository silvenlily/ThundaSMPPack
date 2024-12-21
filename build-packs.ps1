Write-Output "## Building packs ##"

# start packwiz server in background
Write-Output "## Starting packwiz server ##"
Set-Location "./pack/"
packwiz.exe refresh
$PACKWIZ_SERVER = Start-Job -ScriptBlock { packwiz.exe serve }
Set-Location ".."
Write-Output "## Started packwiz server with id: $($PACKWIZ_SERVER.Id) ##"

# create build directory
Write-Output "## Creating build directory ##"
$BUILD_NAME = Get-Date -Format FileDateTimeUniversal
mkdir "./build/build-$($BUILD_NAME)/"
Set-Location "./build/build-$($BUILD_NAME)/"

# download latest packwiz installer bootstrapper
Write-Output "## Downloading installer bootstrapper ##"
Invoke-WebRequest "https://github.com/packwiz/packwiz-installer-bootstrap/releases/latest/download/packwiz-installer-bootstrap.jar" -OutFile ./packwiz-installer-bootstrap.jar

# get all server mod jars
Write-Output "## Downloading all server jars ##"
java -jar packwiz-installer-bootstrap.jar -g -s server "http://localhost:8080/pack.toml"

# stop packwiz server
Write-Output "## Stopping packwiz server ##"
Stop-Job $PACKWIZ_SERVER

# zip mods folder
Write-Output "## Zipping server mods ##"
Compress-Archive -Path ./mods ../ThundaSMP-server-mods.zip

# return to root dir
Set-Location "../../pack"

# build client packs
Write-Output "## Building curseforge client pack ##"
packwiz.exe curseforge export --side client --output ../build/ThundaSMP-curseforge-client.zip
Write-Output "## Building modrinth client pack ##"
packwiz.exe modrinth export --output ../build/ThundaSMP-modrinth-client.mrpack

Set-Location ".."

Write-Output "## Cleaning up ##"
Remove-Item "./build/build-$($BUILD_NAME)/" -Recurse

Write-Output "## Done ##"