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
alias gh='cd /Users/u0166843/Github; ls'
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gp="git push"

# Google drive
alias gd='cd /Users/u0166843/Google\ Drive/SI/; ls'

alias ds='cd /Users/u0166843/Google\ Drive\ File\ Stream/My\ Drive/SI/DataScience/; ls'

alias adp='cd /Users/u0166843/Google\ Drive\ File\ Stream/My\ Drive/SI/DataScience/ADP/; ls'

alias adpd='open https://drive.google.com/drive/folders/0B7zkyECRdPKvVV80S0NCWFNMX3c'


# Notes
alias nb='cd /Users/u0166843/Google\ Drive\ File\ Stream/My\ Drive/Notes/; ls'


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