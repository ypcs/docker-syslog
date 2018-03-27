FROM ypcs/debian:stretch

EXPOSE 514/udp
EXPOSE 601/tcp
EXPOSE 6514/tcp

RUN \
    /usr/local/sbin/docker-upgrade && \
    apt-get --assume-yes install \
        syslog-ng \
        syslog-ng-mod-date && \
    /usr/local/sbin/docker-cleanup

ENTRYPOINT ["/usr/sbin/syslog-ng", "-F"]
RUN echo "Source: https://github.com/ypcs/docker-syslog\nBuild date: $(date +%Y-%m-%d\ %H:%M:%S)" >/README
