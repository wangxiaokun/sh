#!/bin/bash

SERVER_LIST=(192.168.45.133 192.168.45.134)
REMOTE_USER="root"
REMOTE_PASSWORD="rootpwd"

SCRIPT_DIR="$(cd `dirname $0`; pwd)"

###################################################################

USER=`whoami`

if [ "${USER}" == "root" ];then
    ID_RAS_PUB_PATH="/root"
else
    ID_RAS_PUB_PATH="/home/${USER}"
fi

ID_RAS_PUB_FILE_PATH="${ID_RAS_PUB_PATH}/.ssh/id_rsa.pub"

###################################################################

function ssh_copy_local_pub_to_remote()
{
    dst_host=$1
    dst_port=$2
    dst_username=$3
    dst_passwd=$4
    
    echo ""
    echo -e "\033[45;37m 与主机 ${dst_host} 建立信任关系... \033[0m"
    
    /usr/bin/expect ${SCRIPT_DIR}/expect_ssh_copy ${ID_RAS_PUB_FILE_PATH} ${dst_host} ${dst_port} ${dst_username} ${dst_passwd}
    
    if [ "$?" != "0" ]; then
        echo "expect failed"
        exit
    fi
}

for server in ${SERVER_LIST[*]}
do
    #过滤本机
    count=`ifconfig | grep ${server} -c`
    if [ "${count}" == "1" ];then
        continue;
    fi
    
    ssh_copy_local_pub_to_remote ${server} 22 ${REMOTE_USER} ${REMOTE_PASSWORD}
done


