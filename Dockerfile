FROM alpine
MAINTAINER Michael Kueper <michael@kueper-datentechnik.de>

LABEL version latest
LABEL description Simple Subversion Container

RUN apk update \
    && apk upgrade \
    && apk add subversion

VOLUME /var/svn
EXPOSE 3690:3690

CMD svnserve -d -r /var/svn/ --log-file /dev/stdout --foreground
