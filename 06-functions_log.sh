#!/bin/bash

ID=$(id -u)

if [ $ID -ne 0 ]
then
    echo "you are not a root user"
else
    echo "you are a root user"    
fi

yum install mysql -y

if [ $? -ne 0 ]
then
    echo "Error while installing"
else
    echo "installed successfully"
fi