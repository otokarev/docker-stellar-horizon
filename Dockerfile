FROM golang:alpine as builder

ENV  HORIZON_VERSION=v0.11.1

RUN mkdir -p /go/src/github.com/stellar/ \
    && apk add --no-cache git openssh-client curl make gcc musl-dev linux-headers \
    && git clone --branch $HORIZON_VERSION --recursive --depth 1 https://github.com/stellar/horizon.git /go/src/github.com/stellar/horizon \
    && cd /go/src/github.com/stellar/horizon \
    # Fix deleted repo (404 https://github.com/tj/go-debug/tree/ff4a55a20a86994118644bbddc6a216da193cc13)
    && sed -i 's/ff4a55a20a86994118644bbddc6a216da193cc13/bfacf9d8a444b50f5d7ae47727544e775486966f/' vendor/manifest \
    && go get github.com/constabulary/gb/... \
    && gb vendor restore \
    && gb build


FROM alpine:latest

COPY --from=builder /go/src/github.com/stellar/horizon/bin/horizon /usr/local/bin/horizon

EXPOSE 8000

ENTRYPOINT ["/usr/local/bin/horizon"]
