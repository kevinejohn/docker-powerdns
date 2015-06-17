# PowerDNS for Docker

Upstream links:

* Docker Registry @ [kevinejohn/powerdns](https://registry.hub.docker.com/u/kevinejohn/powerdns)
* GitHub @ [kevinejohn/docker-powerdns](https://github.com/kevinejohn/docker-powerdns)

## Quick Start

* Start a Postgresql docker container

    docker run --name pdns-postgres \
      -v /pdns:/var/lib/postgresql/data \
      -e POSTGRES_USER=someuser \
      -e POSTGRES_PASSWORD=somepassword \
      -p 5432:5432 \
      --rm \
      postgres

* Start the PowerDNS

    docker run \
      --link pdns-postgres:pdns \
      --rm \
      kevinejohn/powerdns \
      start_pdns
