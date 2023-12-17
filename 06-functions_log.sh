#!/bin/bash

ID=$(id -u)

VALIDATE(){
    if [ $1 -ne 0 ]
then
    echo "Error::$2"
    exit 1
else
    echo "installed successfully"
fi
}

if [ $ID -ne 0 ]
then
    echo "you are not a root user"
    exit 1
else
    echo "you are a root user"    
fi

yum install mysql -y

VALIDATE $? SQL_installation

yum install git -y

VALIDATE $? git_installation