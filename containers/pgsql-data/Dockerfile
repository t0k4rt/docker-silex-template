FROM debian:jessie

RUN groupadd -r postgres && useradd -r -g postgres postgres

# create and mount volume
RUN mkdir -p /var/lib/postgresql && chown -R postgres:postgres /var/lib/postgresql
VOLUME /var/lib/postgresql

CMD echo "Data-only container for postgresql database"