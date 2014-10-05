# ! /bin/bash

SOURCE="${BASH_SOURCE[0]}"
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

if [ ! -f '.bash_profile' ]; then
    echo "You don't have a .bash_profile, I'll make one for you now at ~/"
    touch ~/.bash_profile
fi

if [ "$MAXXBASHINSTALLED" == "TRUE" ]; then
	echo "You've already installed this!"
else
	cat $DIR/.bash_profile >> ~/.bash_profile
	echo 'Your new bash_profile is ready to go'
fi