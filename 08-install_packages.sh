#!/bin/bash

ID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

VALIDATE(){
    if ( $1 -ne 0 )
    then 
        echo -e "$R error::while $2"
    else 
        echo -e "$G sucessfully $2" 
    fi       
}

if ( $ID -ne 0 )
then 
    echo -e "$R error:: your are not a root user"
else 
    echo -e "$G your a root user" 
fi    

for package in $@
do
    yum list installed $package &>> $LOGFILE
    if( $package -ne 0 )
    then   
        yum install $package -y &>> LOGFILE
        VALIDATE $? install_package
    else
        echo -e "$Y package already installed"
    fi