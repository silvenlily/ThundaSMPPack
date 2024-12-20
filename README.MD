
There are three primary ways of installing this pack

1. use [AT launcher](https://atlauncher.com/) and import a preconfigured pack with autoupdates (Recommended)

2. download the pack file for curseforge or modrinth from releases and manually import it to your launcher (not recommended because you will have to repeat this process anytime the pack is updated)

3. download and run the latest version of the packwiz install bootstrapper to download all the mod's jar files and install them in the approprate mod folder

---
# Option 1 AT Launcher

1. [download and install](https://atlauncher.com/downloads) the AT Launcher version approprate for your operating system (ie: windows, mac, linux)
2. Add your minecraft account on the "Accounts" tab
3. Open the "Instances" tab and click import in the top left corner, paste this in the "URL" box: `TODO:add url`
4. The preconfigured pack is set to use a max of 8gb of ram. If your computer has less then 10gb of ram you should change this to no more then (total ram - 2gb) in Instances > (pack) Settings > Java/Minecraft > Maximum Memory/Ram
5. Press Play and select what optional mods you want

note: You can also import the pack into MultiMC if you already use it, but given its less friendly nature I'm not going to provide directions.

---
# Option 2 Download the pack file

Please note that for technical reasons the autoupdater is incompatable with curseforge or modrinth, therefor you will need to repeat this step anytime the pack is updated.

1. Open the [releases page](https://github.com/silvenlily/ThundaSMPPack/releases) and download the latest pack file for your launcher (ie: ThundaSMP_v.1.0.0_curseforge.zip/ThundaSMP_v.1.0.0_modrinth.zip)
2. import it into your prefered launcher

---
# Option 3 build the pack from this repo

This is a more technical option and assumes you know how to use the terminal

1. download the [latest packwiz bootstrapper](https://github.com/packwiz/packwiz-installer-bootstrap/releases) jar file
2. place the jar file in a new folder
3. run `java -jar packwiz-installer-bootstrap.jar -g -s server https://raw.githubusercontent.com/silvenlily/ThundaSMPPack/refs/heads/main/pack.toml`


