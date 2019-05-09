#!/bin/bash


USER=`whoami`

if [ "${USER}" == "root" ];then
    ID_RAS_PUB_PATH="/root"
else
    ID_RAS_PUB_PATH="/home/${USER}"
fi



ID_RAS_PUB_FILE_PATH="${ID_RAS_PUB_PATH}/.ssh/id_rsa.pub"

if [ -f "${ID_RAS_PUB_FILE_PATH}" ];then
    echo -e "\033[45;37m 文件 ${ID_RAS_PUB_FILE_PATH} 已存在 \033[0m"
    exit 0
else
    echo -e "\033[45;37m 开始生成文件 ${ID_RAS_PUB_FILE_PATH} ... \033[0m"
fi



/usr/bin/expect expect_ssh_keygen

if [ "$?" != "0" ]; then
    echo -e "\033[45;37m failed... \033[0m"
else
    echo -e "\033[45;37m success... \033[0m"
fi


