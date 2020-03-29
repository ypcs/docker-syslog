FROM ypcs/debian:bullseye

#EXPOSE 514/udp
#EXPOSE 601/tcp
#EXPOSE 6514/tcp

RUN \
    /usr/lib/docker-helpers/apt-setup && \
    /usr/lib/docker-helpers/apt-upgrade && \
    apt-get --assume-yes install \
        syslog-ng \
        syslog-ng-mod-date && \
    /usr/lib/docker-helpers/apt-cleanup

ENTRYPOINT ["/usr/sbin/syslog-ng", "-F"]
RUN echo "Source: https://github.com/ypcs/docker-syslog\nBuild date: $(date --iso-8601=ns)" >/README
