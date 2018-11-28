# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/danielhadley/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME=""

# And put in Pure
# https://github.com/sindresorhus/pure
autoload -U promptinit; promptinit

# optionally define some options
PURE_CMD_MAX_EXEC_TIME=10
PURE_GIT_UNTRACKED_DIRTY=0	
PURE_GIT_DOWN_ARROW=⇣

prompt pure


# I Daniel had to do this
# https://github.com/robbyrussell/oh-my-zsh/issues/6835#issuecomment-390216875
ZSH_DISABLE_COMPFIX=true

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

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

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
plugins=(
  git zsh-autosuggestions
)


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

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"



# Putting this in to try and get colors:
# Set CLICOLOR if you want Ansi Colors in iTerm2 
export CLICOLOR=1

# Set colors to match iTerm2 Terminal Colors
export TERM=xterm-256color


# And to get auto suggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh



# Aliases and other things I have added
# EVERYTHING from by .bash_profile below

# Alias for color and human readable output
alias ls='ls -Ghp'

# Easy open 
alias o='open'
alias st='open -a "Sublime Text"'

# Function for cd and listing
cl () { cd "$@" && ls; }


# Github
alias gh='cd /Users/danielhadley/Github; ls'
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gp="git push"

# Google drive
alias gd='cd /Users/danielhadley/Google\ Drive/SI/; ls'

alias ds='cd /Users/danielhadley/Google\ Drive\ File\ Stream/My\ Drive/SI/DataScience/; ls'

alias adp='cd /Users/danielhadley/Google\ Drive\ File\ Stream/My\ Drive/SI/DataScience/ADP/; ls'

alias adpd='open https://drive.google.com/drive/folders/0B7zkyECRdPKvVV80S0NCWFNMX3c'


# Notes
alias nb='cd /Users/danielhadley/Google\ Drive\ File\ Stream/My\ Drive/Notes/; ls'


### Touch types
# Makes a new R file with the current working directory
# First argument is the R's file name
# Second argument is a .csv file, which it adds to the read.csv line 
touchr() { touch $1.R
echo -e '# Created By Daniel Hadley '$(date)' #\nsetwd("'$PWD'")\n#\nlibrary(tidyverse)\n# Load Data\nd <- read_csv("./'$2'")' > $1.R
open $1.R
}


# combine touch and st
touchst () {
	touch "$1"
	st "$1"
}


# Creates a note with the date
touchd () {
	touch "$(date +'%Y-%m-%d')_$1"
	st "$(date +'%Y-%m-%d')_$1"
}


mkdird () {
	mkdir "$(date +'%Y-%m-%d')_$1"
	cl "$(date +'%Y-%m-%d')_$1"
}
# added by Anaconda3 4.1.1 installer
export PATH="//anaconda/bin:$PATH"


# Searches git
# https://stackoverflow.com/questions/11543593/grep-for-stuff-in-multiple-git-repositories
ggrep() {
    find . -type d -name .git | while read line; do
        (
        cd $line/..
        cwd=$(pwd)
        echo "$(tput setaf 2)$cwd$(tput sgr0)"
        git grep -n "$@"
        )
    done
}