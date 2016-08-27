# docker rpi-svn, a simple raspberry pi subversion container

runs subversion server (svnserve), based on hypriot/rpi-alpine-scratch

create container and store data outside of the container run:
```
docker run -d -p 3690:3690 -v /data/path:/var/svn --name server-name mkueper/rpi-svn
```

sample files in folder systemd and upstart to start container on startup
replace container name mk-svn with your container name.

