FROM debian:8.7
MAINTAINER medzoner <medzoner@medzoner.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -q --fix-missing && \
  apt-get -y upgrade && \
  apt-get -y install --no-install-recommends \
                         amavisd-new \
                         arj \
                         bzip2 \
                         clamav \
                         clamav-daemon \
                         curl \
                         dovecot-common \
                         dovecot-core \
                         dovecot-imapd \
                         dovecot-ldap \
                         dovecot-lmtpd \
                         dovecot-managesieved \
                         dovecot-mysql\
                         dovecot-pop3d \
                         dovecot-sieve \
                         ed \
                         fail2ban \
                         fetchmail \
                         file \
                         gamin \
                         gzip \
                         iptables \
                         libmail-spf-perl \
                         libnet-dns-perl \
                         libsasl2-modules \
                         opendkim \
                         opendkim-tools \
                         opendmarc \
                         openssl \
                         p7zip \
                         postfix \
                         postfix-ldap \
                         postfix-mysql \
                         postfix-policyd-spf-python \
                         pyzor \
                         razor \
                         rsyslog \
                         sasl2-bin \
                         spamassassin \
                         postgrey \
                         unzip

WORKDIR /tmp

# Start
#COPY ./start-mailserver.sh /usr/local/bin/
#RUN chmod +x /usr/local/bin/*

#CMD /usr/local/bin/start-mailserver.sh

#entry point
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# Set up the command arguments.
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
