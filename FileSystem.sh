#!/bin/bash

echo "Second Script running"
//text-file containing usernames
userfile=/home/user/usernames.txt 

//extracting usernames text-file
username=$(cat /home/user/usernames.txt | tr 'A-Z'  'a-z')

//allocating passwords
password=$username

//adding suers
for user in $username
do
       //adding users '$user' is a variable that changes
       // usernames accordingly in txt file.
       useradd $user
       echo $password | passwd --stdin $user
done

echo "users have been created" 
tail -n$(wc -l /home/user/usernames.txt) /etc/passwd
cat /etc/passwd

#making directories
echo "SUBROUTINE 2"
echo
mkdir mycode
cd mycode
mkdir c
mkdir python
mkdir java
mkdir others
mkdir public
mkdir private
mkdir temp

#changing directory
echo "Subroutine 3"
echo
echo "enter username you want to change your directory to?"
read un
usermod -l $un user
echo "user changed"

#searching for c, cpp, java files etc.
for file in $(find . -iname "*.c" -type f)
do
filename=$(basename ${file})
if [ ! -f /home/user/mycode/c/${filename} ]; then
    mv ${file} /home/user/mycode/c/${filename}
else
    rm ${file}
fi
done

for file in $(find . -iname "*.java" -type f)
do
filename=$(basename ${file})
if [ ! -f /home/user/mycode/java/${filename} ]; then
    mv ${file} /home/user/mycode/java/${filename}
else
    rm ${file}
fi
done

for file in $(find . -iname "*.cpp" -type f)
do
filename=$(basename ${file})
if [ ! -f /home/user/mycode/c/${filename} ]; then
    mv ${file} /home/user/mycode/c/${filename}
else
    rm ${file}
fi
done

for file in $(find . -iname "*.py" -type f)
do
filename=$(basename ${file})
if [ ! -f /home/user/mycode/python/${filename} ]; then
    mv ${file} /home/user/mycode/python/${filename}
else
    rm ${file}
fi
done
for file in $(find . -iname "*.temp" -type f)
do
filename=$(basename ${file})
if [ ! -f /home/user/mycode/temp/${filename} ]; then
    mv ${file} /home/user/mycode/temp/${filename}
else
    rm ${file}
fi
done

#changing permissions
echo "subroutine 4"
echo
chmod -R 750 /home/user/mycode/c
ls -l /home/user/mycode/c

chmod -R 750 /home/user/mycode/java
ls -l /home/user/mycode/java

chmod -R 750 /home/user/mycode/python
ls -l /home/user/mycode/python

chmod -R 710 /home/user/mycode/others
ls -l /home/user/mycode/others

chmod -R 775 /home/user/mycode/public
ls -l /home/user/mycode/public

chmod -R 700 /home/user/mycode/private
ls -l /home/user/mycode/private

# deleting temp folder
rm -rf /home/user/mycode/temp/*.temp

# changing directory
echo "subroutine 5"
cd
echo
ls

echo
echo "enter folder name to navigate to: "
read fname
if [ ! -f /home/user/${fname} ]; then
    cd /home/user/${fname}
else
    echo "invalid folder name"
fi

echo "subroutine 6"
#installing c compiler
sudo apt-get install gcc

#installing java compiler
sudo apt install default-jre

#installing MySql server
sudo apt update
sudo apt install mysql-server

#checking MySql server
sudo systemctl status mysql
#checking storing disk system space results
df -h | tee DataUsage.txt
cat DataUsage.txt

echo "subroutine 7"
echo
ls /home/user/mycode

if [ ! -f /home/user/mycode/c ]; then
    cd /home/user/mycode/c
else
    echo "folder doesnot exist"
fi

if [ ! -f /home/user/mycode/c/g.c ]; then
    mv g.c g_currentDate.c
else
    echo "file doesnot exist"
fi

gcc -o /home/user/mycode/c/g /home/user/mycode/c/g.c
/home/user/mycode/c/g

#changing prompt
echo $PS1
DEFAULT=$PS1
PS1="[user_Linux] \u@\h:\w\$ "
#Changes the working directory
cd /home/user
#Displays the path of the current working directory
pwd

