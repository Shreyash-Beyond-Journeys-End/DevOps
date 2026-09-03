
d=$(date)
h=$(hostname)
u=$(whoami)

echo "Date: $d"
echo "Hostname: $h"
echo "Username: $u"

echo "Disk Usage:"
df -h

echo "Running processes:"
ps

read -p "Enter directory name: " dir
mkdir $dir

read -p "Enter file name: " file
touch $dir/$file

ps > $dir/$file
echo "Saved running processes to $dir/$file"
