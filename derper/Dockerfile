FROM golang:1.18-alpine as builder
RUN go install tailscale.com/cmd/derper@main

FROM alpine
COPY --from=builder /go/bin/derper /derper
ENTRYPOINT ["/derper"]
