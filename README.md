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
make a .zshrc file in home directory and copy the following
```bash
# Initialize Zgenom
source "${HOME}/.zgenom/zgenom.zsh"

# Load plugins
zgenom load zsh-users/zsh-syntax-highlighting
zgenom load zsh-users/zsh-autosuggestions
zgenom load zsh-users/zsh-completions

# Save the configuration
if ! zgenom saved; then
    zgenom reset
    zgenom save
fi
```
to reload config do 
```bash
source ~/.zshrc
```
### ghostty
Edit the ghostty config file
```bash
nano ~/.config/ghostty/config
```
add the following instructions
```bash
theme=Nocturnal Winter
title = "*"
mouse-hide-while-typing

#font-family = "Hack Nerd Font"
font-family = "Fira Code"
#font-family = "MesloLGM Nerd Font"
#window-padding-x = 2
```
### starship
add the following to shell config
```bash
eval "$(starship init zsh)"
```
set up starship config
```bash
#create starship config file
mkdir -p ~/.config && touch ~/.config/starship.toml
```
download the [starship config](Presets/starship.toml) and move the file
```bash
mv starship.toml ~/.config/starship.toml
```
### yazi
setup yazi shell wrapp to switch directories.
copy paste this in shell config file
```bash
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
```
