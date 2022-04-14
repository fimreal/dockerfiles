FROM golang:alpine AS build
RUN go install github.com/sorenisanerd/gotty@latest

FROM quay.io/derailed/k9s
COPY --from=build /go/bin/gotty /sbin/gotty
ENTRYPOINT []
EXPOSE 8080
CMD ["/sbin/gotty","-w","--permit-arguments","-p","8080","/bin/k9s"]
