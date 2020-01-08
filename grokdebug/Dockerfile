# fork from https://github.com/lunderhage/docker-grokdebug/blob/master/Dockerfile
# FROM ruby:2.4.1-alpine3.6
FROM ruby:2.5.7-alpine3.11

ENV GROK_DIR=/opt/grokdebug
ENV GIT_REPO=https://github.com/Fimreal/grokdebug.git
ENV BUILD_PACKAGES="git make gcc musl-dev linux-headers"

RUN apk update && apk --no-cache add $BUILD_PACKAGES && \
	git clone https://github.com/Fimreal/grokdebug.git $GROK_DIR && \
	cd $GROK_DIR && \
	sed -i "s/haml.*/&\, '4.0.7'/" Gemfile && \
 	gem update && \
 	gem install json -v '2.1.0' && \
 	gem install raindrops -v '0.19.0' && \
 	gem install haml -v '~>4.0.0' && \
 	bundle update && \
 	apk del $BUILD_PACKAGES --purge

WORKDIR $GROK_DIR

CMD ["rackup", "-o", "0.0.0.0", "-p", "80"]
