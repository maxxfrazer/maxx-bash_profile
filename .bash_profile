#   -------------------------------
#   1.  ENVIRONMENT CONFIGURATION
#   -------------------------------

#   Change Prompt
#   ------------------------------------------------------------
    export PS1="________________________________________________________________________________\n| \w @ \h (\u) \n| => "
    export PS2="| => "

#   Set Paths
#   ------------------------------------------------------------
    export PATH="$PATH:/usr/local/bin/"
    export PATH="/usr/local/git/bin:/sw/bin/:/usr/local/bin:/usr/local/:/usr/local/sbin:/usr/local/mysql/bin:$PATH"


#   -----------------------------
#   2.  MAKE TERMINAL BETTER
#   -----------------------------


makeBlipp() {
   local blippName=$1;
   if [[ -z $blippName ]]; then
       blippName="main";
   fi
   mkdir -p $blippName/{assets/$blippName/src/,markers,xml};
   touch $blippName/assets/$blippName/src/$blippName.blp;
   makeTheMake $blippName;
}
makeTheMake() {
   echo 'NAME?  = '$1'

BBP     = BBP
ZIP     = zip
RM      = rm

BBPFLAGS    = -q -l Blipp/src/library/

BLIPPDEF    = p100000

BLP     = Blipp/assets/$(NAME)/src/$(NAME).blp
PLIST       = Blipp/xml/$(NAME).plist
ANDROID_PATH    = /sdcard/Android/data/com.blippar.ar.android/system/blippDefs/$(BLIPPDEF)

all:        $(NAME)

$(NAME):    compile zip

compile:
        $(BBP) $(BBPFLAGS) -c $(BLP) -o $(PLIST)

zip:
        $(ZIP) -r $(NAME).zip Blipp/assets Blipp/markers Blipp/xml

clean:
        $(RM) $(NAME).zip

install_android: compile
        @adb push $(PLIST) $(ANDROID_PATH)
        @echo "Installed PLIST on Android"

install_ios: compile
        @cp $(PLIST) $(PATH_FOLDER)
        @echo "Installed PLIST on IOS"

install_assets_android:
        @adb push Blipp/assets/$(NAME)/ $(ANDROID_PATH)
        @echo "Installed Assets on Android"

install_assets_ios:
        @cp Blipp/assets/$(NAME)/* $(IOS_PATH)
        @echo "Installed Assets on IOS"' > $1/Makefile;
}

# Idea of this from bent's repo

alias gito='gitac'
gitac() {
   git add -A;
   git commit -m "$*";
   git pull;
   git push;
}

alias cdstart='cd /Volumes/Maxx/blipps/'	# edit to be your blipps directory
alias subd='subl .'							# opens all contents in sublime text
alias o='open .'							# opens all contents in finder
alias rmf='rm -rf'							# shorthand for rm -rf

alias cp='cp -iv'                           # Preferred 'cp' implementation
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
alias ll='ls -FGlAhp'                       # Preferred 'ls' implementation
alias less='less -FSRXc'                    # Preferred 'less' implementation
alias edit_bash='subl ~/.bash_profile'                    # Preferred 'less' implementation
cd() { builtin cd "$@"; ll; }               # Always list directory contents upon 'cd'
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels
alias edit='subl'                           # edit:         Opens any file in sublime editor


#   cdf:  'Cd's to frontmost window of MacOS Finder
#   ------------------------------------------------------
    cdf () {
        currFolderPath=$( /usr/bin/osascript <<EOT
            tell application "Finder"
                try
            set currFolder to (folder of the front window as alias)
                on error
            set currFolder to (path to desktop folder as alias)
                end try
                POSIX path of currFolder
            end tell
EOT
        )
        echo "cd to \"$currFolderPath\""
        cd "$currFolderPath"
    }

zipf () { zip -r "$1".zip "$1" ; }          # zipf:         To create a ZIP archive of a folder
alias numFiles='echo $(ls -1 | wc -l)'      # numFiles:     Count of non-hidden files in current dir
