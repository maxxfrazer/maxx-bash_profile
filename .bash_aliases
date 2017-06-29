#disk stuff
alias check="checkdirectories"
checkdirectories(){
  for directory in `ls -l | grep ^d | awk '{print $9}'`;
  do echo $directory; du -ch $directory 2>> ~/duch_error_log | tail -n 2; echo -------------;
  done && rm ~/duch_error_log;
}

# Bunch of aliases

alias gits='git status'                     # shorthand for git status
alias o='open .'				            # opens all contents in finder

alias reload_bash='source ~/.bash_profile'
alias cp='cp -iv'                           # Preferred 'cp' implementation
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
alias ll='ls -FGlAhp'                       # Preferred 'ls' implementation
alias less='less -FSRXc'                    # Preferred 'less' implementation
alias edit_bash='vi ~/.bash_profile'        # Quick way to edit bash_profile
cd() { builtin cd "$@"; ll; }               # Always list directory contents upon 'cd'
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels
alias f='open -a Finder ./'                 # f:            Opens current directory in MacOS Finder
alias ~="cd ~"                              # ~:            Go Home
alias c='clear'                             # c:            Clear terminal display
alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
alias fix_stty='stty sane'                  # fix_stty:     Restore terminal settings when screwed up
alias cpwd='echo `pwd` | pbcopy'            # cpwd:         Copy working directory to clipboard

#   -----------------------------
#   SAFETY NETS
#   -----------------------------

# confirmation #
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'

# Parenting changing perms on / #
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'
