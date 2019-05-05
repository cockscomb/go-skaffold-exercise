# syntax=docker/dockerfile:experimental

FROM golang:1.12-stretch as builder

WORKDIR /go/src/github.com/cockscomb/go-skaffold-exercise

COPY *.go .

RUN --mount=type=cache,target=/root/.cache/go-build go build -o server


FROM debian:stretch

WORKDIR /go/src/github.com/cockscomb/go-skaffold-exercise

EXPOSE 8080

COPY --from=builder /go/src/github.com/cockscomb/go-skaffold-exercise/server .

CMD ./server
