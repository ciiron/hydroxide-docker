FROM golang:1.14.2-alpine as builder

RUN mkdir /src/

WORKDIR /src/

RUN GO111MODULE=on GOPATH=/src/ go get github.com/emersion/hydroxide/cmd/hydroxide

FROM alpine:latest
LABEL maintainer="ciiron@pm.me"


RUN mkdir /hydroxide

WORKDIR /usr/bin

COPY --from=builder /src/bin /usr/bin/

EXPOSE 25
EXPOSE 143
EXPOSE 80

ENV XDG_CONFIG_HOME="/"

CMD XDG_CONFIG_HOME=/ hydroxide -imap-host 0.0.0.0 -smtp-host 0.0.0.0 -carddav-host 0.0.0.0 -imap-port 143 -smtp-port 25 -carddav-port 80 serve

