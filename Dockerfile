FROM alpine:3.19
LABEL maintainer="Michael Kueper <michael@kueper-datentechnik.de>"
LABEL version="latest"
LABEL description="Simple Subversion Container"

RUN apk update \
    && apk add subversion \
    && rm -rf /var/cache/apk/*

VOLUME /var/svn
EXPOSE 3690

CMD svnserve -d -r /var/svn/ --log-file /dev/stdout --foreground
