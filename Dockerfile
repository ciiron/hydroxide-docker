FROM golang:1.14.2-alpine
LABEL maintainer="ciiron@pm.me"

WORKDIR /usr/bin

RUN GO111MODULE=on go get github.com/emersion/hydroxide/cmd/hydroxide

EXPOSE 1025
EXPOSE 1143
EXPOSE 8080

CMD hydroxide -imap-host 0.0.0.0 -smtp-host 0.0.0.0 -carddav-host 0.0.0.0 serve

