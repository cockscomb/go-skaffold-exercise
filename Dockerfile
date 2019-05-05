FROM golang:1.12.4-stretch as builder

WORKDIR /go/src/github.com/cockscomb/go-skaffold-exercise

COPY *.go .

RUN go build -o server

FROM debian:stretch

WORKDIR /go/src/github.com/cockscomb/go-skaffold-exercise

COPY --from=builder /go/src/github.com/cockscomb/go-skaffold-exercise/server .

CMD ./server
