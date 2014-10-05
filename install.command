# ! /bin/bash

SOURCE="${BASH_SOURCE[0]}"
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

echo "DIR is '$DIR'"

if [ ! -f '.bashProf1' ]; then
    echo "File not found!"
    touch ~/.bashProf1
fi

if [ "$MAXXBASHINSTALLED" == "TRUE" ]; then
	echo 'Already installed!'
else
	cat $DIR/.bash_profile >> ~/.bashProf1
	echo 'Your new bash_profile is ready to go'
fi