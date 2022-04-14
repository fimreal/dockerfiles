## 镜像更新

修改 Dockerfile 中 MYCAT_VERSION 变量至最新版本，重新构建即可。



## 基础用法



[可选]在源数据库中创建连接使用账号密码

```sql
CREATE USER 'mycat'@'%' IDENTIFIED BY '123456';
GRANT XA_RECOVER_ADMIN ON *.* TO 'root'@'%';
GRANT ALL PRIVILEGES ON *.* TO 'mycat'@'%' ;
flush privileges;
```



Docker 启动

```bash
# 进入存放 mycat 配置目录
cd path/to/mycat_dir
# 启动容器，把配置模板复制到当前目录
docker run -d --name init-mycat epurs/mycat
docker cp init-mycat:/mycat/conf ./conf
docker rm -f init-mycat
# 根据需要修改 ./conf 中配置文件
# 例如修改源数据库连接配置: conf/datasources/prototypeDs.datasource.json

# 启动
docker run -d --name mycat -p 8066:8066 -v $PWD/conf:/mycat/conf epurs/mycat
```



可能问题

mycat 默认日志配置会在 mycat/logs 目录内写日志，可能会占用大量空间没有清理，所以启动命令可以改成

```bash
docker run -d --name mycat -p 8066:8066 -v $PWD/conf:/mycat/conf epurs/mycat
```

对于已启动容器，可以 ln -s /dev/null 到日志文件后，重启服务。

又或者在外部添加定时任务清空。