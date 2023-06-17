<div align="center">

# ❖Dynamic-wallpaper-wayland ❖

![GitHub Repo stars](https://img.shields.io/github/stars/SMark5/dynamic-wallpaper-wayland?style=for-the-badge&labelColor=1B2330&color=807EDD) ![GitHub last commit](https://img.shields.io/github/last-commit/SMark5/dynamic-wallpaper-wayland?style=for-the-badge&labelColor=1B2330&color=807EDD) ![GitHub repo size](https://img.shields.io/github/repo-size/SMark5/dynamic-wallpaper-wayland?style=for-the-badge&labelColor=1B2330&color=807EDD)

*Inspired by adi1090x/dynamic-wallpaper*

</div>

## <samp>Dependencies</samp>

- cron : To set a scheduler
> **Note**
> choose what you use (wayland or xorg) <br>
> If you want to use xorg change the comments as seen below
- swaybg: To set wallpapers on wayland
- feh : To set wallpapers on xorg 

install cron swaybg
```bash
# On Ubuntu or Debian
sudo apt-get install swaybg cron

# On Fedora
sudo dnf install swaybg cronie

# On Arch 
sudo pacman -S swaybg cronie

# On Gentoo (I personaly use dcron)
doas emerge --ask swaybg dcron

# On Void (Install your favorite cron)
doas xbps-install -S swaybg <cron>
```

## :wrench: <samp>INSTALLATION</samp>

### :paperclip: <samp>Standard</samp>

> **Warning**
> Some additional configuration maybe required

<kbd>1.</kbd> Clone the repository.

> **Note**
> I personally create a folder in my home directory (called SystemFiles) and clone the repository there.
```bash
cd 
mkdir SystemFiles
cd SystemFiles/
git clone https://github.com/SMark5/config.git --recurse-submodules
cd config
```
<kbd>2.</kbd> Setup cron job.
> **Note**
> In order to use this script you need to setup a cron job <br>
<kbd>1.</kbd> First intall cron <br>
<kbd>2.</kbd> After installing cron, enable and start the cron service <br>
- Systemd users (most people linux mint, ubuntu, debian, arch, fedora etc.)
```bash
sudo systemctl enable cronie.service --now
```
- Openrc users
https://wiki.gentoo.org/wiki/Cron
> **Note**
> Install what you like (I personaly use dcron)
```bash
doas rc-update add dcron default
```
- Runit users
https://docs.voidlinux.org/config/services/index.html#enabling-services
> **Note**
> Install what you like
```bash
doas ln -s /etc/sv/<service-name> /var/service/
```
- Other init system users (I think you get the point)

<kbd>3.</kbd> Make a cron job.
> **Note**
> you need to add the following enviroment variables

```bash
echo "$WAYLAND_DISPLAY | $DISPLAY | $XDG_RUNTIME_DIR"
#my output
wayland-1 | :0 | /run/user/1000
```

```bash
crontab -e
# Add this line replacing the values of env variable and style with yours
0 * * * * WAYLAND_DISPLAY=wayland-1 DISPLAY=:0 XDG_RUNTIME_DIR=/run/user/1000 $HOME/SystemFiles/dynamic-wallpaper-wayland/wallpaper.sh
```

> **Warning**
> Don't forget to change $HOME/SystemFiles if you placed it somewhere else

<kbd>4.</kbd> Change script variables.
> **Note**
> optional
- Open the wallpaper.sh file with your favorite text editor

```bash
#change the DIR variable accordingly where you want to place it
DIR="$HOME/SystemFiles/dynamic-wallpaper/images/firewatch/
```
- you can use it with xorg  just change the comments

```bash
#!/bin/sh 

## Author  : SMark5
#Inspired by adi1090x/dynamic-wallpaper 

## Dynamic Wallpaper : Set wallpapers according to current time.
## Created to work better with job schedulers (cron)

#change the DIR variable accordingly where you want to place it
DIR="$HOME/SystemFiles/dynamic-wallpaper/images/firewatch/"
HOUR=`date +%k`
FORMAT=".png"

#wayland
#set background
#swaybg -o \* -i $DIR$HOUR.png -m fill
#sleep 1
# kill all older processes of swaybg
#kill $(ps -eo pid,etime,comm | grep 'swaybg' | awk '{ print $1 }' | head -n -1)

#xorg
#if you want to use xorg just uncomment the line bellow
#and comment the wayland lines above
feh --bg-fill $DIR$HOUR.png
```

## :bookmark_tabs: <samp>How to add own wallpapers</samp>

- Download a wallpaper set you like.
- Rename the wallpapers (must be jpg/png) to 0-23. If you don't have enough images, symlink them.
- Make directory to $HOME/SystemFiles/dynamic-wallpaper/images/
- Rename DIR variable to DIR="$HOME/SystemFiles/dynamic-wallpaper/images/yourWallpaperDirName

## <samp>Sources</samp>

- Dynamic-wallpaper: [adi1090x/dynamic-wallpaper](https://github.com/adi1090x/dynamic-wallpaper)
- Readme: [Sigmanificient/dotfiles](https://github.com/Sigmanificient/dotfiles)

# <samp>Thanks for reading!</samp>

![alt dwall](https://raw.githubusercontent.com/adi1090x/files/master/dynamic-wallpaper/lakeside.gif)
