# Stellar Horizon Docker image

[![Docker Stars](https://img.shields.io/docker/stars/otokarev/stellar-horizon.svg)](https://hub.docker.com/r/otokarev/stellar-horizon/)
[![Docker Pulls](https://img.shields.io/docker/pulls/otokarev/stellar-horizon.svg)](https://hub.docker.com/r/otokarev/stellar-horizon/)
[![Build Status](https://travis-ci.org/otokarev/docker-stellar-horizon.svg?branch=bare)](https://travis-ci.org/otokarev/docker-stellar-horizon/)
[![ImageLayers](https://images.microbadger.com/badges/image/otokarev/stellar-horizon.svg)](https://microbadger.com/#/images/otokarev/stellar-horizon)

## Configuration

All environment variables that Stellar Horizon supports are supported. You can find out all available options by running `docker run --rm -it stellar-horizon horizon --help`. T

* `DATABASE_URL`: *Horizon* database URL, e.g., `postgres://horizon-db-host/stellar-horizon`.
* `STELLAR_CORE_DATABASE_URL`: *Stellar Core* database URL, e.g., `postgres://core-db-host/stellar-core`.
* `STELLAR_CORE_URL`: *Stellar Core* HTTP URL, e.g., `http://core-host:11626`.
* `INGEST`: ingest data from Stellar Core (true/false)
