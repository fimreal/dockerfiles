sftpserver
---
默认使用 root 账号，22 端口，禁止 ssh 登陆，自定义时添加参数 `-p {端口号}` 食用。
sftp 根目录在 /sftpuser 
例子：
```bash
docker run -d --name sftpserver -v $PWD:/sftproot/$PWD  -p 2222:22 epurs/sftpserver
```
