# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="agnoster"
ZSH_THEME="powerlevel9k/powerlevel9k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(git autojump zsh-autosuggestions)
plugins=(
    git 
    vi-mode 
    colored-man-pages 
    colorize #ccat
    command-not-found #suggests packages if command not found
    # pip 
    python 
    common-aliases #https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/common-aliases
    jsontools
    zsh-interactive-cd
    autojump
    sudo # double tap esc for sudo
    # virtualenv
    #virtualenvwrapper
	zsh-autosuggestions
	# zsh-syntax-highlighting
	)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"






####################################################
####### TERMINAL / ZSH / OH-MY-ZSH related #########
####################################################

# Syntax Highlighting
source /home/frimann/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#### Powerlevel9k adjustments
#POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(virtualenv context dir vcs vi_mode )
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(virtualenv context dir vcs newline vi_mode )
# POWERLEVEL9K_PROMPT_ADD_NEWLINE=true

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

#### Set default shell editor
export VISUAL=vim
export EDITOR="$VISUAL"

#### used for plugins=(... zsh-interactive-cd)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#### Add ssh keys
eval $(ssh-agent)
ssh-add ~/.ssh/id_rsa_dte &> /dev/null
ssh-add ~/.ssh/id_rsa_personal &> /dev/null

####################################################
######### ALIASES ##################################
####################################################

#### pbcopy and pbpaste
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

#### Handy aliases and functions
function cl () {
    cd $1
    ls
}

function cll () {
    cd $1
    ll
}

alias gittree='git log --graph --pretty=oneline --abbrev-commit' 
alias 'psg'='ps ax | grep '
alias 'psgi'='ps ax | grep -i'
alias 'shortcuts'='code "/home/frimann/1.info/1.My Linux shortcuts.md"'



####################################################
######## PATHS #####################################
####################################################
export PATH=$HOME/bin:$PATH
export PATH=$PATH:/opt/mssql-tools/bin




####################################################
######## setup EA environment #####################
####################################################

#### ROS
# from ros install
source /opt/ros/melodic/setup.zsh

# run env.zsh in every shell
pushd /home/frimann/ros/ea1000-ros-ws/; source env.zsh; popd 

## old
#source /opt/ros/melodic/setup.zsh
#source /home/frimann/ros/ea1000-ros-ws/devel/setup.zsh
#source /home/frimann/ros/FlexBE_keyboardTest/devel/setup.zsh
#source /home/frimann/ros/msg_test/devel/setup.zsh
#source /home/frimann/ros/FlexBE_tutorials/devel/setup.zsh
#source /home/frimann/ros/ProgrammingRobotsWithROS/my_workspace/devel/setup.zsh

#### Elasticsearch and kibana
export ES_HOME=/usr/share/elasticsearch
export KIBANA_HOME=/usr/share/kibana
export LS_HOME=/usr/share/logstash




####################################################
######## REMINDERS #################################
####################################################
echo "\n"
echo ----------------- STUFF -----------------------
echo "shortcuts    to display shortcuts collection"
echo "F9 in vim    run current file with python"
echo ----------------- COMMANDS -----------------------
echo "ccat         for colorized cat"
echo "pp_json      for pretty print json"
echo "2x esc       for sudo"
echo "cl           for cd and ls"
echo "cll          for cd and ll"
echo "psg          for ps ax \| grep "
echo "psgi         for ps ax \| grep -i "
echo -----------------------------------------------
