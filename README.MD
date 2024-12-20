# About

This is the modpack for the thunda smp private server.  
It it build using [packwiz](https://packwiz.infra.link/).

# Installation

There are three primary ways of installing this pack

1. use [AT launcher](https://atlauncher.com/) and import a preconfigured pack with autoupdates (Recommended)

2. download the pack file for curseforge or modrinth from releases and manually import it to your launcher (not recommended because you will have to repeat this process anytime the pack is updated)

3. download and run the latest version of the packwiz install bootstrapper to download all the mod's jar files and install them in the approprate mod folder

---
## Option 1 AT Launcher

1. [download and install](https://atlauncher.com/downloads) the AT Launcher version approprate for your operating system (ie: windows, mac, linux)
2. Add your minecraft account on the "Accounts" tab
3. Open the "Instances" tab and click import in the top left corner, paste this in the "URL" box: `https://github.com/silvenlily/ThundaSMPPack/raw/refs/heads/main/PreconfiguredPack.zip`
4. By default the preconfigured pack is set to use a max of 8gb of ram. If your computer has less then 10gb of ram you should change this to no more then (<your system ram> - 2gb) in Instances > (pack) Settings > Java/Minecraft > Maximum Memory/Ram
5. Press Play and select what optional mods you want

note: You can also import the pack into MultiMC if you already use it, but given its less friendly nature I'm not going to provide directions.

---
## Option 2 Download the pack file

Please note that for technical reasons the autoupdater is incompatable with curseforge or modrinth, therefor you will need to repeat this step anytime the pack is updated.

1. Download the latest pack file for your launcher from the pinned message in discord (ie: ThundaSMP-v1.0.0-curseforge.zip/ThundaSMP-v1.0.0-modrinth.mrpack)
2. import it into your prefered launcher

---
## Option 3 build the pack from this repo

This is a more technical option and assumes you know how to use the terminal (and have a modern version of java installed)

1. download the [latest packwiz bootstrapper](https://github.com/packwiz/packwiz-installer-bootstrap/releases) jar file
2. place the jar file in a new folder
3. open a terminal window in this folder and run `java -jar packwiz-installer-bootstrap.jar -s client https://raw.githubusercontent.com/silvenlily/ThundaSMPPack/refs/heads/main/pack/pack.toml`
4. all mods are now placed in the newly created mods folder

# Building pack files

On windows if you have the [packwiz cli tool](https://packwiz.infra.link/installation/) and java isntalled you should just be able to run the `build-packs.ps1` script. As a good citizen of the net I'm sure you will read the entire script and understand what it does before running it. You may need to change your script execution policy to allow running powershell scripts. Don't do this unless you understand the implications of doing so.

# Manually Building client pack files

Assumes you have the [packwiz cli tool](https://packwiz.infra.link/installation/) and have git (and java) installed

The first time you do this you will need to clone the repo
```sh
git clone https://github.com/silvenlily/ThundaSMPPack.git
```

Before each time you build the pack you should pull any updates to the pack from the git repo
```
git pull
```

To build curseforge and modrinth client packs run in the `packs` directory:
```sh
packwiz curseforge export --side client --output ../ThundaSMP-v-curseforge.zip
packwiz modrinth export --output ../ThundaSMP-v-modrinth.mrpack
```
# Manually Building server mod folder
You will need to download the [packwiz installer bootstrapper](https://github.com/packwiz/packwiz-installer-bootstrap/releases) (and have a modern version of java installed).

To build based on the git repo create a new folder, place the installer boostrapper in it and run
```
java -jar packwiz-installer-bootstrap.jar -g -s server https://raw.githubusercontent.com/silvenlily/ThundaSMPPack/refs/heads/main/pack/pack.toml
```

To build based on your local repo first have packwiz serve your local copy of the pack (inside your packs directory):
```sh
packwiz refresh
packwiz serve
```

Then run the installer boostrapper in server mode in a new folder:
```sh
java -jar packwiz-installer-bootstrap.jar -g -s server http://localhost:8080/pack.toml
```
