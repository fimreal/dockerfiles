

#### Example

```yaml
apiVersion: v1
kind: Secret
metadata:
  name: passwd-cosfs
  namespace: infra
type: Opaque
data:
  passwd-cosfs: <base64 encode>
---
apiVersion: apps/v1
kind: DaemonSet
metadata:
  namespace: infra
  labels:
    app: cosfs-clouddisk
  name: cosfs-clouddisk
spec:
  selector:
    matchLabels:
      app: cosfs-clouddisk
  template:
    metadata:
      labels:
        app: cosfs-clouddisk
    spec:
      tolerations:
        - key: node-role.kubernetes.io/master
          effect: NoSchedule
      initContainers:
      - name: umountpoint
        image: epurs/osfs
        command:
        - "umount"
        - "/opt/cos/clouddisk"
        securityContext:
          capabilities:
            add:
            - SYS_ADMIN
          privileged: true
        volumeMounts:
        - name: cosfs-clouddisk
          mountPath: /opt/cos/clouddisk
      containers:
      - name: cosfs-clouddisk
        image: epurs/osfs
        securityContext:
          capabilities:
            add:
            - SYS_ADMIN
          privileged: true
        command: ["/usr/bin/cosfs","-opasswd_file=/etc/cos/passwd-cosfs","clouddisk-appid","/opt/cos/clouddisk","-ourl=http://cos.ap-beijing.myqcloud.com","-f","-odbglevel=debug","-oallow_other"]
        volumeMounts:
        - name: passwd-cosfs
          mountPath: /etc/cos/
        - name: devfuse
          mountPath: /dev/fuse
        - name: cosfs-clouddisk
          mountPath: /opt/cos/clouddisk
          mountPropagation: Bidirectional
      volumes:
      - name: passwd-cosfs
        secret:
          secretName: passwd-cosfs
          defaultMode: 0600
      - name: devfuse
        hostPath:
          path: /dev/fuse
      - name: cosfs-clouddisk
        hostPath:
          path: /opt/cos/clouddisk

```
