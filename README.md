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

Create a folder where the hydroxide `auth.json` will persist.

#### via `docker run`

`docker run --name hydroxide -p smtp-port:25 -p imap-port:143 -p carddav-port:80 -v -d /path/to/data/directory:/hydroxide hydroxide` where `*-port` is the port to allocate for the service on the host.

#### via docker-compose

Optionally tweak the ports in the `docker-compose.yml` then run `docker-compose up -d` in the directory with the `docker-compose.yml`

Here is the sample docker-compose file
```yaml
version: '3.8'

services:
  hydroxide:
    image: hydroxide
    ports:
      - 1025:25
      - 1143:143
      - 8080:80
    volumes:
      - ./data:/hydroxide```

### Authenticating

Run `docker exec -ti hydroxide hydroxide auth username` where `username` is your Protonmail username (without @protonmail.com/ch).  For example if your email is `ciiron@protonmail.com`, the username would be `ciiron`
Enter your password when prompted.

Copy the bridge password (if authenticated correctly) and use it to connect.

### Usage

Connect to your SMTP and IMAP and CardDAV servers with the ports you specified on your computer's identity (locally, you can use 127.0.0.1).  Use your username as the username (see above) and the password as the bridge password.
