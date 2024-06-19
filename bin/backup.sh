#!/bin/bash

echo " --> Going to USB"
cd /Volumes/Data2024/

month=`date +%b`
echo " --> Creating Month docco"

DOCCO='Documents-$month-2024'

if [ ! -d ${DOCCO} ]; 
then
    mkdir Documents-$month-2024
    mkdir Documents-$month-2024/Pictures
else 
    echo " --> Folder exists"
fi

echo " --> Going to Docs"
cd ~/Documents
sleep 5

echo " --> cp shells "
cp -R ~/.aliases  /Volumes/Data2024/Documents-$month-2024/
cp -R ~/.bashrc  /Volumes/Data2024/Documents-$month-2024/
cp -R ~/.zshrc  /Volumes/Data2024/Documents-$month-2024/
sleep 5

echo " --> cp .kube "
cp -R ~/.kube  /Volumes/Data2024/Documents-$month-2024/
sleep 5

echo " --> cp .ssh "
cp -R ~/.ssh  /Volumes/Data2024/Documents-$month-2024/
sleep 5

echo " --> cp passwords "
cp -R ~/Passwords.kdb*  /Volumes/Data2024/Documents-$month-2024/
sleep 5

echo " --> Copying 00-docs"
cp -R 00-docs-00 /Volumes/Data2024/Documents-$month-2024/
sleep 5

echo " --> Copying 00-personal"
cp -R 00-personal-00 /Volumes/Data2024/Documents-$month-2024/
sleep 5

echo " --> Copying 4-DEV"
cp -R 4-DEV* /Volumes/Data2024/Documents-$month-2024/
sleep 5

echo " --> Copying 5-QA"
cp -R 5-QA* /Volumes/Data2024/Documents-$month-2024/
sleep 5

echo " --> Copying 6-PROD"
cp -R 6-PROD* /Volumes/Data2024/Documents-$month-2024/
sleep 5

echo " --> Copying A*"
cp -R A* /Volumes/Data2024/Documents-$month-2024/
sleep 5

echo " --> Copying 0 txts"
cp -R 0*.txt /Volumes/Data2024/Documents-$month-2024/
sleep 5

echo " --> Copy D&G"
cp -R Domestic* /Volumes/Data2024/Documents-$month-2024/
sleep 5

# echo " --> Copy GitHub"
# cp -R GitHub* /Volumes/Data2024/Documents-$month-2024/
# sleep 5

echo " --> Copy Harvard"
cp -R HARVARD* /Volumes/Data2024/Documents-$month-2024/
sleep 5

echo " --> Copy ISTIO"
cp -R ISTIO* /Volumes/Data2024/Documents-$month-2024/
sleep 5

echo " --> Copy J*"
cp -R J* /Volumes/Data2024/Documents-$month-2024/
sleep 5

echo " --> Copy Orca"
cp -R ORCA* /Volumes/Data2024/Documents-$month-2024/
sleep 5

echo " --> Copy RKE"
cp -R RKE* /Volumes/Data2024/Documents-$month-2024/
sleep 5

echo " --> Copy Zoom"
cp -R Zoom* /Volumes/Data2024/Documents-$month-2024/
sleep 5

echo " --> Copy zz-home"
cp -R zz-home* /Volumes/Data2024/Documents-$month-2024/
sleep 5

echo " --> Copy Installed"
cp -R zz-installed* /Volumes/Data2024/Documents-$month-2024/
sleep 5

echo " --> Going to Pictures"
cd ~/Pictures

echo " --> Copy 00-personal"
cp -R 00-personal* /Volumes/Data2024/Documents-$month-2024/Pictures
sleep 5

echo " --> Copy Background"
cp -R Background* /Volumes/Data2024/Documents-$month-2024/Pictures
sleep 5

echo " --> Copy HARVARD"
cp -R HARVARD* /Volumes/Data2024/Documents-$month-2024/Pictures
sleep 5