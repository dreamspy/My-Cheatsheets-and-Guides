# Ubuntu setup guide
	
# System Tweaks

## Install tweaks
	sudo add-apt-repository universe
	sudo apt install gnome-tweak-tool

~~Remember to set CAPS as ESC and SHIFT+SHIFT as CAPS in the Tweaks program.~~
This has to be done in `.zshrc` for hjkl uiop to work alongside.

Note for the dim extension, to get rid of the overlayed text edit the config file at `/home/frimann/.local/share/gnome-shell/extensions/dim.desktop.70@d0h0.tuta.io`
	
## Install shell extensions
Follow directions at https://itsfoss.com/gnome-shell-extensions/

## Quickview files in file browser
Installed with
```
sudo apt-get install gnome-sushi
```

## Setup keyboard
For setting
- CAPS as ESC
- Double SHIFT as CAPS
- ~~CAPS + HJKL & UIOP as universal VIM keys~~ (this doesn't work with is keybaard)
  
Add this to `.zshrc`:
```
#### Setup keyboard CAPS behaviour 
# Note, the order of commands is important 
   
# 2x SHIFT as CAPS 
setxkbmap -option shift:both_capslock 
  
# caps as escape 
setxkbmap -option caps:escape 
  
# hjkl and uiop (note doesn't work with caps lock active) 
# this wasn't working well with is keyboard 
#xmodmap ~/.xmodmap 
  
# caps as escape 
# this works with xmodmap, but was failing randomly 
#xcape -e 'Mode_switch=Escape' 
```


---
# Programs
## Install code
Follow directions at https://snapcraft.io/code

To allow Caps to be used as escape, add this to `$HOME/.config/Code/User/settings.json`:

```
{
    "keyboard.dispatch": "keyCode"
}
```

---
# Terminal setup
## Install ZSH and OH-MY-ZSH

Follow guide from here https://dev.to/mskian/install-z-shell-oh-my-zsh-on-ubuntu-1804-lts-4cm4.

## Install Powerlevel9k
Run
```
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
```

Add to `.zshrc`:
```
ZSH_THEME="powerlevel9k/powerlevel9k"
```

## Install autojump
Add this to `.zshrc` (no install required).
```
plugins=(autojump)
```

## Install autosuggestions
Run
```
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

Add this to `.zshrc`:
```
plugins=(zsh-autosuggestions)
```

## Install Ultimate VIM
Run
```
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh
```
Add this to `.vimrc`:
```
"syntax highlighting for XML for a non XML file"
"au BufNewFile, BufRead *.launch set filetype=xml"

"show current line number AND relative line numbers
"also works by doing 
"  :set nu rnu
:set number relativenumber

"map F9 to run python with current file as argument
nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>
```

## Install Colorize (`ccat`)
First install `pygments`
```
sudo apt-get install -y python-pygments
```
Then add
```
plugins=(colorize)
```

## Install zsh-interactive-cd
Install `fzf`:
```
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```
and add this to `.zshrc':
```
plugins=(... zsh-interactive-cd)
```

## Install tmux and .tmux
Install `tmux`:
```
sudo apt install tmux
```
Install `.tmux`:
```
cd
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local . 
```
and copy `.tmux.conf.local.` from this repo to `$HOME`.
