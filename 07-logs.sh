#!/bin/bash

ID=$(id -u)

TIMESTAMP=$(date)
LOGFILE="/tmp/$0_$TIMESTAMP.log"

VALIDATE(){
    if [ $1 -ne 0 ]
then
    echo "Error::$2"
    exit 1
else
    echo "$2 successfully"
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