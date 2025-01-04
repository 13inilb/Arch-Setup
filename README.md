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
<details><summary> zsh</summary>

### zsh Setup
check for zsh 
```sh
zsh --version
```
enable the installed zsh
```sh
chsh -s /usr/bin/zsh
```
logout for changes to take place and confirm current shell using
```sh
echo $SHELL
```
</details>


<details><summary>zgenom</summary>

### zgenom Setup
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
</details>

<details><summary>ghostty</summary>
	
### ghostty Setup
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
</details>

<details><summary>starship</summary>

### starship Setup
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
</details>

<details><summary>yazi</summary>
	
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
</details>

## Neovim Setup

 <details>
	 <summary>Color Scheme</summary>

### Set ColorSchem
download any color scheme available in [nvim](ColorScheme/nvim)
move the file to `~/.config/nvim/colors/`
then append the nvim config file `init.lua` 
```sh
vim.opt.termguicolors = true
#here we are using nocturnal-winter.lua color scheme
vim.cmd([[colorscheme nocturnal-winter]])
```
 </details>
 
<details>
	<summary>lazy.nvim</summary>

 ### lazy.nvim Setup

 configure the ` ~/.config/nvim/init.lua ` with the code
 ```sh
vim.g.mapleader = " "
require("config.lazy")
```
next configure the `~/cofig/nvim/lua/config/lazy.lua` with the code
```sh
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)


-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "plugins" },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})
```
### Telescope Plugin for Neovim
configure `~/cofig/nvim/lua/plugin/telescope.lua`
```sh
return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local telescope = require('telescope')
        telescope.setup({
            defaults = {
                prompt_prefix = "> ",
                selection_caret = "> ",
                path_display = { "smart" },
            },                                                                                         })
    end,                                                                                           keys = {
        { '<leader>ff', function() require('telescope.builtin').find_files() end, desc = "Find Files" },
        { '<leader>fg', function() require('telescope.builtin').live_grep() end, desc = "Live Grep" },
        { '<leader>fb', function() require('telescope.builtin').buffers() end, desc = "List Buffers" },
        { '<leader>fh', function() require('telescope.builtin').help_tags() end, desc = "Help Tags" },
    }
}
```
</details>
