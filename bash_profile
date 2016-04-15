# alias test
alias o='open'

cl() { cd "$1" && ls; }

alias gh='cd /Users/DHadley/Github/; ls'

alias p='mount_smbfs //dhadley@fileshare1/Departments2 ~/P; cd ~/P/Somerstat\ Data/; ls'
alias k='mount_smbfs //dhadley@fileshare1/Departments ~/K; cd ~/K/Somerstat/Common; ls'
alias g='mount_smbfs //dhadley@fileshare1/GIS ~/G; cd ~/G/gis_data/; ls'

# Makes a new R file with the current working directory
# First argument is the R's file name
# Second argument is a .csv file, which it adds to the read.csv line 
touchr() { touch $1.R
echo -e '# Created By Daniel Hadley '$(date)' #\nsetwd("'$PWD'")\n#\n# Load Data\nd <- read.csv("./'$2'")' > $1.R
open $1.R
}

# sublime
alias st='open -a "Sublime Text 2"'

# Git hub
# The first argument is optional
# Defaults are in the {:-}
gc() {
  git commit -am ${1:-"alias update"} && git push
}


# Set CLICOLOR if you want Ansi Colors in iTerm2 
export CLICOLOR=1
# Set colors to match iTerm2 Terminal Colors
export TERM=xterm-256color

# added by Anaconda 2.3.0 installer
export PATH="/Users/DHadley/anaconda/bin:$PATH"
