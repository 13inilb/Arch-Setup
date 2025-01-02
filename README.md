# Arch-Setup
Arch Setup framework

## Change Wallpaper
change the fekking wallpaper using [Wallpapers]

## Packages Setup
Download the [pkglist] file to system and install the packages using :
```bash
sudo pacman -S --needed - < pkglist.txt
```
additionally to create the pkglist.txt file, use :
```bash
sudo pacman -Qqe > pkglist.txt
```
## Terminal Setup
### zsh
check for zsh 
```bash
zsh --version
```
enable the installed zsh
```bash
chsh -s /usr/bin/zsh
```
logout for changes to take place and confirm current shell using
```bash
echo $SHELL
```
### zgenom
install zgenom 
```bash
git clone https://github.com/jandamm/zgenom.git "${HOME}/.zgenom"
```


