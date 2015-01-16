#disk stuff
alias check="checkdirectories"
checkdirectories(){
  for directory in `ls -l | grep ^d | awk '{print $9}'`;
  do echo $directory; du -ch $directory 2>> ~/duch_error_log | tail -n 2; echo -------------;
  done && rm ~/duch_error_log;
}
