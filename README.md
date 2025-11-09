# Docker RPI-SVN

A simple Raspberry Pi Subversion container.

Runs a small Subversion server (svnserve) based on the [Alpine Official Docker Image](https://hub.docker.com/_/alpine/).

## Table of Contents

- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
- [Usage](#usage)
  - [Building the Image](#building-the-image)
  - [Running the Container](#running-the-container)
  - [Creating a Repository](#creating-a-repository)
- [Development](#development)
  - [Dockerfile](#dockerfile)
  - [Scripts](#scripts)
- [Testing](#testing)
- [License](#license)

## Getting Started

### Prerequisites

- [Docker](https://docs.docker.com/get-docker/) installed on your system.

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/mkueper/docker-rpi-svn.git
   cd docker-rpi-svn
   ```

## Usage

### Building the Image

The `build.sh` script creates a Docker image from the `Dockerfile` with the tag `mkueper/rpi-svn`.

```bash
./build.sh
```

### Running the Container

The `run.sh` script requires two arguments: a name for the container and the path where the data should be stored.

```bash
./run.sh my-svn-container /docker-data/subversion
```

Alternatively, you can create the container manually:

```bash
docker run -d -p 3690:3690 -v /data/path:/var/svn --name server-name mkueper/rpi-svn
```

### Creating a Repository

To create a new repository, use the `docker exec` command:

```bash
docker exec -it your-container-name svnadmin create /var/svn/repo-name
```

> You can edit the config files (`svnserve.conf`, `passwd`, `authz`, and `hooks-env.tmpl`) with an editor in the Subversion data directory on your host.

## Development

### Dockerfile

The `Dockerfile` is based on `alpine:3.19` and installs the `subversion` package. It exposes port `3690` and sets the default command to run `svnserve`.

### Scripts

- `build.sh`: Builds the Docker image.
- `run.sh`: Creates and runs a Docker container.
- `test.sh`: Runs a test suite to ensure the container is working correctly.

## Testing

The `test.sh` script builds the image, runs a container, creates a test repository, and then cleans up the test environment.

```bash
./test.sh
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.