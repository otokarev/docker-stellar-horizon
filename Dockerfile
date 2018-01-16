FROM golang:alpine as builder

RUN apk add --no-cache git gcc linux-headers musl-dev glide mercurial \
    && go env \
    && mkdir -p $GOPATH/src/github.com/stellar/ \
    && git clone https://github.com/stellar/go.git $GOPATH/src/github.com/stellar/go \
    && cd $GOPATH/src/github.com/stellar/go \
    && glide install \
    && go env \
    && cp -r $GOPATH/src/github.com/stellar/go/vendor/* $GOPATH/src/ \
    && go install github.com/stellar/go/services/horizon


FROM alpine:latest

COPY --from=builder /go/bin/horizon /usr/local/bin/horizon

EXPOSE 8000

ENTRYPOINT ["/usr/local/bin/horizon"]
