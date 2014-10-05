maxx-bash_profile
=================

My bash profile (and similar) filled with functions I've made and aliases gathered from various places.

run install.command to append .bash_profile or create if it doesn't exist yet
.bash_profile can be a complete override if you want, otherwise append at the end of your existing .bash_profile

.gitconfig contents to be added to the bottom of your existing .gitconfig file


both files are hidden due to starting with a period, ls -li should display them in terminal.
use '$ subl .' to open all files in sublime text




recommended to install, assuming user already has sublime text:


[Sublime text 2 OS X Command Line](https://www.sublimetext.com/docs/2/osx_command_line.html)


OR

[Sublime text 3 OS X Command Line](https://www.sublimetext.com/docs/3/osx_command_line.html)

if copy/pasting the setup `ln -s "/Applications...` then make sure that the last bit of the line
`... ~/bin/subl` is a bin directory that actually exists. OSX environments don't typically include a `~/bin` in the users home directory so if you don't feel like making one and adding it to your `$PATH`, it's better to remove the squiggly there and go (for ST3):

`ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /bin/subl`

and more likely that would need a sudo:
``` bash
$ sudo ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /bin/subl
```
