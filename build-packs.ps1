# start packwiz server
Set-Location "./pack/"
packwiz.exe refresh
$PACKWIZ_SERVER = Start-Job -ScriptBlock { packwiz.exe serve }
Set-Location ".."

# create build directory
$BUILD_NAME = Get-Date -Format FileDateTimeUniversal
mkdir "./build/build-$($BUILD_NAME)/"
Set-Location "./build/build-$($BUILD_NAME)/"

# download latest packwiz installer bootstrapper
Invoke-WebRequest "https://github.com/packwiz/packwiz-installer-bootstrap/releases/latest/download/packwiz-installer-bootstrap.jar" -OutFile ./packwiz-installer-bootstrap.jar

# get server all mod jars
java -jar packwiz-installer-bootstrap.jar -g -s server "http://localhost:8080/pack.toml"

# stop packwiz server
Stop-Job $PACKWIZ_SERVER

# zip mods folder
Compress-Archive -Path ./mods ../ThundaSMP-server-mods.zip

Set-Location ".."

Remove-Item "./build-$($BUILD_NAME)/" -Recurse

# return to root dir
Set-Location "../pack"

# build client packs
packwiz.exe curseforge export --side client --output ../build/ThundaSMP-curseforge-client.zip
packwiz.exe modrinth export --output ../build/ThundaSMP-modrinth-client.mrpack

Set-Location ".."
