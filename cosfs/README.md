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
