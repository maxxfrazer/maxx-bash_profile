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
	echo "source .extra_profile" >> ~/.bash_profile
	echo 'Your new bash_profile is ready to go'
fi

cp $DIR/.extra_profile  ~/.extra_profile



if [ ! -f '/Applications/Sublime Text.app' ]; then
    sudo ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /bin/subl
else
	if [ ! -f '/Applications/Sublime Text 2.app' ]; then
		sudo ln -s "/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl" /bin/subl
	fi
fi
