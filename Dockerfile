FROM debian:8.7
MAINTAINER medzoner <medzoner@medzoner.com>

RUN apt-get update
RUN apt-get install -y   amavisd-new \
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

RUN apt-get install -y   nginx

# Start
COPY ./start-mailserver.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/*

CMD /usr/local/bin/start-mailserver.sh

WORKDIR /tmp
