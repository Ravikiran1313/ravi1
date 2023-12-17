#!/bin/bash

ID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

TIMESTAMP=$(date +%F-%H-%M-%S)
LOGFILE="/tmp/$0_$TIMESTAMP.log"

VALIDATE(){
    if [ $1 -ne 0 ]
then
    echo "$R Error::$N $2"
    exit 1
else
    echo "$G $2 $N successfully"
fi
}

if [ $ID -ne 0 ]
then
    echo "you are not a root user"
    exit 1
else
    echo "you are a root user"    
fi

yum install mysql -y &>> $LOGFILE

VALIDATE $? SQL_installation

yum install git -y &>> $LOGFILE

VALIDATE $? git_installation