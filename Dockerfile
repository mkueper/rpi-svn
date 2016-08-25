FROM hypriot/rpi-alpine-scratch
MAINTAINER Michael Kueper <michael@kueper-datentechnik.de>

LABEL version latest
LABEL description Simple Subversion Container

RUN [ "cross-build-start" ]

RUN apk update \
    && apk upgrade \
    && apk add subversion

VOLUME /var/svn
EXPOSE 3690:3690

CMD svnserve -d -r /var/svn/ --log-file /dev/stdout --foreground

RUN [ "cross-build-end" ]
