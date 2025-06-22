FROM egladman/redbean as build

FROM alpine/git AS git-clone
WORKDIR /tmp
RUN git clone --depth=1 https://codeberg.org/fyr77/dns-mobileconfig.git repo\
    && rm -rf repo/.git

FROM scratch

COPY --from=build /redbean.com /
COPY --from=git-clone /tmp/repo /wwwroot
COPY Dockerfile /
CMD ["/redbean.com", "-vv", "-p", "80", "-D", "/wwwroot"]
