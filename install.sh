# ! /bin/bash

SOURCE="${BASH_SOURCE[0]}"
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
CURRENTOSIS=`sw_vers -productVersion`
version=$(echo $CURRENTOSIS | grep -o '[^-]*$')
major=$(echo $version | cut -d. -f1)
minor=$(echo $version | cut -d. -f2)
micro=$(echo $version | cut -d. -f3)

if [ ! -f ~/.bash_profile ]; then
    echo "You don't have a .bash_profile, I'll make one for you now"
    touch ~/.bash_profile
fi

if [ ! -f ~/.extra_profile ]; then
  echo "Installing extra_profile now"
	printf "\nsource ~/.extra_profile" >> ~/.bash_profile
fi

which -s brew
if [[ $? != 0 ]] ; then
  echo "Installing Homebrew";
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";
fi

brew install git && brew install bash-completion;

cp $DIR/.extra_profile  ~/.extra_profile
cp $DIR/.bash_aliases  ~/.bash_aliases

# If ~./inputrc doesn't exist yet, first include the original /etc/inputrc so we don't override it
if [ ! -a ~/.inputrc ]; then echo "\$include /etc/inputrc" > ~/.inputrc; fi

# Add option to ~/.inputrc to enable case-insensitive tab completion
echo "set completion-ignore-case On" >> ~/.inputrc
