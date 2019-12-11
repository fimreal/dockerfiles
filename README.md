Dockerfile 收集仓库
---

一些可公开的容器化工具的记录

#### nopasswd_sshd

默认 22 端口，自定义时添加参数 `-p {端口号}` 食用。

#### sftpserver

默认使用 root 账号，22 端口，禁止 ssh 登陆，自定义时添加参数 `-p {端口号}` 食用。
sftp 根目录在 /sftpuser
例子：
```bash
docker run -d --name sftpserver -v $PWD:/sftproot/$PWD  -p 2222:22 epurs/sftpserver
```
#### cosfs

镜像包含 cosfs 运行环境，本意用来在 Kubernetes 中挂载腾讯云对象存储目录使用，食用方法查看仓库子目录中 README.md

#### pt-query-digest

基础镜像(tag: base)是干净的 perl 环境和 pt-query-digest 脚本，方便国内下载使用。用例：
```bash
REPORTFILE=$(mktemp -u report.XXXXXX)
docker run -v $PWD/slowlog:/slowlog epurs/sftpserver:base --report /slowlog > $REPORTFILE
```
