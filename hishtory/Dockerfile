FROM golang:1.20-alpine as builder
# ENV GOPROXY=https://goproxy.cn,direct
# ENV CGO_ENABLED=1
ADD backend /backend
RUN cd /backend && go build -o /server -ldflags "-s -w" /backend/server.go

FROM alpine:latest
COPY --from=builder /server /server
ENTRYPOINT ["/server"]

# ENV PORT 8080
# ENV HISHTORY_MAX_NUM_USERS
# ENV HISHTORY_ENV prod
# ENV HISHTORY_POSTGRES_DB ""
# ENV HISHTORY_SQLITE_DB "hishtory.db"

HEALTHCHECK  --interval=5s --timeout=3s \
    CMD nc -nvz 127.0.0.1 ${PORT-8080}