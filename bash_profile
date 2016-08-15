# local network
# Mount p
alias mp='open "smb://ad\u0166843@files.business.utah.edu/shares”; cl /Volumes/shares/PIL/'

alias p='cl /Volumes/shares/PIL/'


# Alias for color and human readable output
alias ls='ls -Ghp'

# Easy open 
alias o='open'
alias st='open -a "Sublime Text"'

# Function for cd and listing
function cl () {
    cd $1
    ls
}


# Github
alias gh='cd /Users/danielhadley/Github; ls'
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gp="git push"


### Touch types
# Makes a new R file with the current working directory
# First argument is the R's file name
# Second argument is a .csv file, which it adds to the read.csv line 
touchr() { touch $1.R
echo -e '# Created By Daniel Hadley '$(date)' #\nsetwd("'$PWD'")\n#\n# Load Data\nd <- read.csv("./'$2'")' > $1.R
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