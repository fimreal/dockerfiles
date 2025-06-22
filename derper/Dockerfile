FROM golang:1.20-alpine as builder
# ENV GOPROXY=https://goproxy.cn,direct
RUN go install tailscale.com/cmd/derper@latest

FROM alpine
COPY --from=builder /go/bin/derper /derper
ENTRYPOINT ["/derper"]
