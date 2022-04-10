FROM debian:sid

RUN apt -y update && apt -y install git lintian-brush ognibuild sbuild

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
