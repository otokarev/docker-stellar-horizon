FROM golang:alpine as builder

#Snapshots 2018-01-10-23:14:45
ENV HORIZON_VERSION=eb8599c75aebcbe2fbf89fba3a5d9e13a4402201


RUN apk add --no-cache git gcc linux-headers musl-dev glide mercurial \
    && go env \
    && mkdir -p $GOPATH/src/github.com/stellar/ \
    && git clone https://github.com/stellar/go.git $GOPATH/src/github.com/stellar/go \
    && cd $GOPATH/src/github.com/stellar/go \
    && git checkout $HORIZON_VERSION \
    && glide install \
    && go env \
    && cp -r $GOPATH/src/github.com/stellar/go/vendor/* $GOPATH/src/ \
    && go install github.com/stellar/go/services/horizon


FROM alpine:latest

COPY --from=builder /go/bin/horizon /usr/local/bin/horizon

EXPOSE 8000

ENTRYPOINT ["/usr/local/bin/horizon"]
