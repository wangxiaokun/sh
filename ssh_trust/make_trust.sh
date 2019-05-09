#!/bin/bash


#安装spawn
#sudo yum install -y tcl tclx tcl-devel expect

###################################################################

SCRIPT_DIR="$(cd `dirname $0`; pwd)"


###################################################################

sh ${SCRIPT_DIR}/ssh_keygen.sh

if [ "$?" != "0" ]; then
    echo -e "\033[45;37m ssh_keygen.sh failed \033[0m"
    exit
else
    echo -e "\033[45;37m ssh_keygen.sh success \033[0m"
fi

###################################################################

sh ${SCRIPT_DIR}/ssh_copy.sh

if [ "$?" != "0" ]; then
    echo -e "\033[45;37m ssh_copy.sh failed \033[0m"
    exit
else
    echo -e "\033[45;37m ssh_copy.sh success \033[0m"
fi

