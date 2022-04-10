FROM debian:sid

RUN apt -y update && apt -y install git lintian-brush ognibuild sbuild git-buildpackage
RUN mkdir -p /srv/chroot && sbuild-createchroot --include=eatmydata,ccache unstable /srv/chroot/unstable-amd64-sbuild

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
