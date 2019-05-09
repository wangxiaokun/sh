执行 sh ssh_trust.sh 即可建立本机与其他主机之间的信任关系(单向)

1. ssh_trust.sh 脚本先调用 ssh_keygen.sh 脚本检查本机是否需要生成公钥和私钥文件
    如果需要生成，则调用 expect_ssh_keygen 脚本生成

2. ssh_trust.sh 脚本调用 ssh_copy.sh 脚本将本机公钥文件填充到远程机器上的authorized_keys
    ssh_copy.sh 脚本则调用 expect_ssh_copy 脚本完成交互
    ssh_copy.sh 脚本中定义了需要建立信任关系的远程机器列表，会循环该列表进行处理