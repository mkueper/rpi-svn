# docker rpi-svn, a simple raspberry pi subversion container

Runs a small subversion server (svnserve), based on [hypriot/rpi-alpine-scratch](https://github.com/hypriot/rpi-alpine-scratch)

### Create an image and an conatiner with Script files
- The script `build.sh` creates a image from Dockerfile with the tag mkueper/rpi-svn.
- The script `run.sh` needs two arguments. The first argument is a name for the container (e.g. mk-svn). The second argument is the path where the date schould stored. (e.g. ```./run.sh mk-svn /docker-data/subversion```)

### Create the container by hand
Create the container and store the data outside of your container run:
```
docker run -d -p 3690:3690 -v /data/path:/var/svn --name server-name mkueper/rpi-svn
```

### Sample Startup Scripts
In folders systemd and upstart you could find sample files to start the container on rpi startup. Replace the container name `mk-svn` with your own container name.

### Create a new repository
```
  docker exec -it your-container-name svnadmin create /var/svn/repo-name
```

> You can edit the config files (svnserve.conf, passwd, authz and hooks-env.tmpl) with an editor in the subversion data directory on your host.
