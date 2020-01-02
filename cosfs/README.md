镜像包含 cosfs 运行环境，本意用来在 Kubernetes 中挂载腾讯云对象存储目录使用

简要步骤：

1. 创建密码文件

```yaml
apiVersion: v1
kind: Secret
metadata:
  name: passwd-cosfs
  namespace: cosfs
type: Opaque
data:
  passwd-cosfs: # base64 decode
```

2. 创建 ds 进程挂载

```yaml
apiVersion: extensions/v1beta1
kind: DaemonSet
metadata:
  namespace: cosfs
  labels:
    app: cosfs-res
  name: cosfs-res
spec:
  template:
    metadata:
      labels:
        app: cosfs-res
    spec:
    # affinity:
    #   nodeAffinity:
    #     requiredDuringSchedulingIgnoredDuringExecution:
    #       nodeSelectorTerms:
    #       - matchExpressions:
    #         - key: type
    #           operator: In
    #           values:
    #           - res
    # tolerations:
    #   - key: node-role.kubernetes.io/master
    #     effect: NoSchedule
      initContainers:
      - name: umountpoint
        image: alpine
        command:
        - "umount"
        - "/opt/cos/community"
        securityContext:
          capabilities:
            add:
            - SYS_ADMIN
          privileged: true
        volumeMounts:
        - name: cosfs-community
          mountPath: /opt/cos/community
      containers:
      - name: cosfs-res
        image: epurs/cosfs
        securityContext:
          capabilities:
            add:
            - SYS_ADMIN
          privileged: true
        command: ["/usr/bin/cosfs","-opasswd_file=/etc/cos/passwd-cosfs","${BUCKETNAME}","/opt/cos/res","-ourl=http://cos.ap-beijing.myqcloud.com","-f"]
        volumeMounts:
        - name: passwd-cosfs
          mountPath: /etc/cos/
        - name: devfuse
          mountPath: /dev/fuse
        - name: cosfs-res
          mountPath: /opt/cos/res:shared
    # imagePullSecrets:
    # - name: epurs
      volumes:
      - name: passwd-cosfs
        secret:
          secretName: passwd-cosfs
          defaultMode: 0600
      - name: devfuse
        hostPath:
          path: /dev/fuse
      - name: cosfs-res
        hostPath:
          path: /opt/cos/res
```

3. 应用添加挂载选项

```yaml
# ...
        volumeMounts:
        - name: cosfs-res
          mountPath: /opt/cos/res:shared
      volumes:
      - name: cosfs-res
        hostPath:
          path: /opt/cos/res
# ...
```
---

附 systemd 挂载 cosfs 配置文件模板

需要修改并确认 bucket 名字`test-1256163609`、地域`beijing`以及挂载点`/mnt` 是否正确

```
[Unit]
Description=Mount QCloud COS Bucket
After=network.target

[Mount]
What=cosfs#test-1256163609
Where=/mnt
Type=fuse
Options=_netdev,allow_other,url=http://cos.ap-beijing.myqcloud.com,dbglevel=info
```

注意⚠️：
密码文件需要放在 `/etc/passwd-cosfs`、`~/.passwd-cosfs`，权限应为 600 。
系统需要安装 fuse 。腾讯云文档中提示 2.9.4 (CentOS7 yum repo 版本为 2.9.2)： libfuse 在低于 2.9.4 版本的情况下可能会导致 COSFS 进程异常退出。此时，建议您参见 [COSFS 工具 文档](https://cloud.tencent.com/document/product/436/6883#.E5.AE.89.E8.A3.85.E5.92.8C.E4.BD.BF.E7.94.A8)更新 fuse 版本或安装最新版本的 COSFS。

https://public-yum.oracle.com/repo/OracleLinux/OL7/UEKR4/x86_64/index.html

