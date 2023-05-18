FROM screenbreak/singlefile-dockerized:latest

RUN apt install -y --force-yes --no-install-recommends fonts-wqy-microhei

ENTRYPOINT ["/usr/bin/python3", "webserver.py"]
