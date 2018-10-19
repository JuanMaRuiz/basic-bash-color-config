#########################
#  Variable definitions #
#########################
# \h Host name up to first .
# \n newline
# \s The name of shell
# \t The current time format in 24-hour format
# \u The user name of the current user
# \w The current working directory
# \W The basename of the current working directory

####################
# Color definition #
####################
orange="$(tput setaf 166)";
yellow="$(tput setaf 228)";
green="$(tput setaf 71)";
white="$(tput setaf 15)";
bold="$(tput bold)";
reset="$(tput sgr0)";


########################
# Git branch in prompt #
########################

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

PS1="\[${bold}\]\n"; 
PS1="\[${orange}\]\u"; 				          # Username
PS1+="\[${white}\] at ";
PS1+="\[${yellow}\]\h";                       # Host
PS1+="\[${white}\] in ";
PS1+="\[${green}\]\W";                        # Working directory
PS1+="\[${white}\] on";
PS1+="\[${yellow}\]$(parse_git_branch) -> ";  # Working directory
PS1+="\n";
PS1+="\[${white}\]\$ \[${reset}\]";
export PS1;