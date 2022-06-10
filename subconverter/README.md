## subconverter
---

ref. https://github.com/tindy2013/subconverter


#### deploy on kubernetes

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  labels:
    app: subconverter
  name: subconverter
spec:
  replicas: 1
  selector:
    matchLabels:
      app: subconverter
  template:
    metadata:
      labels:
        app: subconverter
        tier: srv
    spec:
      containers:
      - name: subconverter
        image: epurs/subconverter:latest
        imagePullPolicy: Always
        ports:
        - containerPort: 25500
          name: http
        resources:
          limits:
            cpu: 100m
            memory: 50Mi
        readinessProbe:
          tcpSocket:
            port: 25500
          initialDelaySeconds: 10
          periodSeconds: 30
          timeoutSeconds: 5
          successThreshold: 1
          failureThreshold: 3
---
# --------------- svc -------------- ##
apiVersion: v1
kind: Service
metadata:
  name: subconverter
spec:
  type: ClusterIP
  ports:
    - name: http
      port: 25500
      targetPort: 25500
  selector:
    app: subconverter
```
