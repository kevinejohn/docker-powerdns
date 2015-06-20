# PowerDNS for Docker

Extensively tested on [Digital Ocean $5/mo node](http://bit.ly/1Lgakgl).


Upstream links:

* Docker Registry @ [kevinejohn/powerdns](https://registry.hub.docker.com/u/kevinejohn/powerdns)
* GitHub @ [kevinejohn/docker-powerdns](https://github.com/kevinejohn/docker-powerdns)

## Quick Start

* Start a Postgresql docker container

        docker run --name pdns-postgres \
          -v /powerdns:/var/lib/postgresql/data \
          -e POSTGRES_USER=someuser \
          -e POSTGRES_PASSWORD=somepassword \
          -p 5432:5432 \
          --rm \
          postgres

* Start the PowerDNS container

        docker run \
          --link pdns-postgres:pdns \
          --rm -it \
          -p 53:53 \
          kevinejohn/powerdns

* Or start the PowerDNS container with different parameters

        docker run \
          --link pdns-postgres:pdns \
          --rm -it \
          -p 53:53 \
          kevinejohn/powerdns \
          powerdns_run --help
