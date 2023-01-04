# A setup guide for an extra smooth terminal experience on MacOS - 2018.08 
## Info
Installed on Drungi MacOS 10.13.16 in august 2018
	
## With tips and tricks partly taken from :

[Oh-My-Zsh! A Work of CLI Magic — Tutorial for Ubuntu ](https://medium.com/wearetheledger/oh-my-zsh-made-for-cli-lovers-installation-guide-3131ca5491fb)

[kevin-smets/iterm2-solarized.md](https://gist.github.com/kevin-smets/8568070)

[macOS Setup Guide](http://sourabhbajaj.com/mac-setup/)

## Installation history

### Homebrew
Install homebrew

	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	
Install some essential programs using brew cask:

	brew install --cask iTerm2 Sublime-text etc..

### iTerm2
Download settings and color profiles from [here](https://github.com/dreamspy/Cheatsheets-and-Guides/tree/master/Settings%20Backup/iTerm2). Double click color profiles to install, and copy ```com.googlecode.iterm2.plst``` to ```~/Library/Preferences```.

### ZSH
Install zsh

	brew install zsh
	
install oh my zsh

	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

Change theme to agnoster and add zsh plugins

Install brew packages

	brew install autojump git mackup tree vim

Add to .zshrc:

	plugins = (....., autojump)
	
Install zsh-autosuggestions
	
	git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

Add plugin "zsh-auosuggestions" to .zshrc
	
Install zsh-syntax-highlighting

	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

Add zsh-syntax-highlighting to .zshrc (has to be the last plugin loaded)

### VIM

Install ultimate vim

	git clone https://github.com/amix/vimrc.git ~/.vim_runtime
	sh ~/.vim_runtime/install_awesome_vimrc.sh

Install iTerm [Solarized Dark theme](https://raw.githubusercontent.com/mbadolato/iTerm2-Color-Schemes/master/schemes/Solarized%20Dark%20-%20Patched.itermcolors)

Or this custom [Solarized Dark Neon theme](https://raw.githubusercontent.com/dreamspy/Cheatsheets-and-Guides/master/Solarized%20Dark%20Neon.itermcolors) 

### If you want Powerlevel theme do this:

Install Powerlevelk9
	
	git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k	
	
Change zsh theme to powerlevel9k/powerlevel9k (Agnoster is also powerline based)

Install patched fonts from here

- [Meslo](https://github.com/powerline/fonts/blob/master/Meslo%20Slashed/Meslo%20LG%20M%20Regular%20for%20Powerline.ttf)
- [Source code  Pro](https://github.com/powerline/fonts/blob/master/Meslo%20Slashed/Meslo%20LG%20M%20Regular%20for%20Powerline.ttf)
- [Ubuntu Mono](https://github.com/powerline/fonts) (This one is the best)

Set fonts in iTerm2 and Terminal	

#### Install ZVH (zsh-vi-mode)
Clone `zsh-vi-mode` into your custom plugins repo:

	git clone https://github.com/jeffreytse/zsh-vi-mode \
	$ZSH_CUSTOM/plugins/zsh-vi-mode

Then load as a plugin in your `.zshrc`

	plugins+=(zsh-vi-mode)

Create the file `~/.oh-my-zsh/custom/prompt/viModeCursor.sh` with these contents

```
function zle-keymap-select zle-line-init
{
    # change cursor shape in iTerm2
    case $KEYMAP in
        vicmd)      print -n -- "\E]50;CursorShape=0\C-G";;  # block cursor
        viins|main) print -n -- "\E]50;CursorShape=1\C-G";;  # line cursor
    esac

    zle reset-prompt
    zle -R
}

function zle-line-finish
{
    print -n -- "\E]50;CursorShape=0\C-G"  # block cursor
}

zle -N zle-line-init
zle -N zle-line-finish
zle -N zle-keymap-select
```
and add this to .zshrc

	[[ ( -f ~/.oh-my-zsh/custom/prompt/viModeCursor.sh ) ]] && source ~/.oh-my-zsh/custom/prompt/viModeCursor.sh

### Mackup

Mackup is backing up these guys:

- Moom
- karabiner elements
- ssh
- vim

Symlink .mackup and .mackup.cfg to ~/Dropbox/Mackup versions

Restore settings from Mackup (add -n for a dry run)
	
	mackup restore

### OSXFuse and SSHFS 

For mounting remote file systems over SSH

#### Installation:

	brew cask install osxfuse
	brew install sshfs
	
#### Using:

SSH-ing to your server:
	
	sudo sshfs -o allow_other,defer_permissions,IdentityFile=~/.ssh/id_rsa user@host:/remotefolder/ /localfolder

or for short:

	sshfs user@host:/remoteFolder /localFolder

	

