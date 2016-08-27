# docker rpi-svn, a simple raspberry pi subversion container

Runs a small subversion server (svnserve), based on hypriot/rpi-alpine-scratch

Create the container and store the data outside of your container run:
```
docker run -d -p 3690:3690 -v /data/path:/var/svn --name server-name mkueper/rpi-svn
```

### Startup Scripts
In folders systemd and upstart you could find sample files to start the container on rpi startup. Replace the container name `mk-svn` with your own container name.

### Script file
- The script `build.sh` creates a container from Dockerfile with the tag mkueper/rpi-svn.
- The script `run.sh` needs two arguments. The first argument is a name for the container (e.g. mk-svn). The second argument is the path where the date schould stored. Example ```./run.sh mk-svn /docker-data/subversion```
