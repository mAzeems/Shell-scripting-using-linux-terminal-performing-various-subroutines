#! /bin/sh
echo Hi, Please enter your username:
read uname
echo
echo Welcome $uname!
echo
Date=$(date +"%m-%d-%Y")
time=$(date +"%T")
echo It\'s time to code again, DATE: "$Date", TIME: "$time"
echo
echo Redirecting to user home directory ...
cd /home/user
_mydir="$(pwd)"
echo "The current working path is: $_mydir"
echo "The current shell is: $SHELL"
echo
echo "The purpose of this script is to perform two subroutines, the first subroutine takes the username and displays it. it also displays current date, time, working directory and shell type. the second subroutine takes an input number of users and pass it to the second shell script
FileSystem.sh."
echo
echo -n "Enter number of users you want to create between 1 and 20: "
read unumber
export unumber

if [[ $unumber -le 0 ]] || [[ $unumber -ge 21 ]]
then
  echo "Invalid input!!! Try again"
else
  sh ./FileSystem.sh usernames.txt
fi

