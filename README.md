# hydroxide-docker
Dockerfile for [emersion/hydroxide](https://github.com/emersion/hydroxide) 3rd party Protonmail bridge

## Usage

### Prerequsites

- `docker`
- `docker-compose` (optional)
- `git` (optional)

Clone this repository via `git clone` (or really you could just download the Dockerfile in a new directory).
Run `docker build -t hydroxide .` to build the image.

### Running

#### via `docker run`

`docker run -p smtp-port:1025 -p imap-port:1143 -p carddav-port:8080` where `*-port` is the port to allocate for the service on the host.

#### via docker-compose

Optionally tweak the ports in the `docker-compose.yml` then run `docker-compose up -d` in the directory with the `docker-compose.yml`
