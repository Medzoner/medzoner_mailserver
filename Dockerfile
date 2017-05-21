FROM nginx:1.11

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -q --fix-missing && \
  apt-get -y install --no-install-recommends \
                         arj \
                         bzip2 \
                         bash \
                         curl \
                         cron \
                         ed \
                         file \
                         gamin \
                         gzip \
                         iptables \
                         libmail-spf-perl \
                         libnet-dns-perl \
                         libsasl2-modules \
                         openssl \
                         postgrey \
                         p7zip \
                         pyzor \
                         razor \
                         rsyslog \
                         sasl2-bin \
                         spamassassin \
                         unzip

RUN apt-get -y install --no-install-recommends \
                         amavisd-new

RUN apt-get -y install --no-install-recommends \
                         dovecot-common \
                         dovecot-core \
                         dovecot-imapd \
                         dovecot-ldap \
                         dovecot-lmtpd \
                         dovecot-managesieved \
                         dovecot-mysql\
                         dovecot-pop3d \
                         dovecot-sieve

RUN apt-get -y install --no-install-recommends \
                         fail2ban \
                         fetchmail

RUN apt-get -y install --no-install-recommends \
                         opendkim \
                         opendkim-tools \
                         opendmarc

RUN apt-get -y install --no-install-recommends \
                         postfix \
                         postfix-ldap \
                         postfix-mysql \
                         postfix-policyd-spf-python

WORKDIR /tmp

#entry point
COPY ./entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

RUN touch /etc/mailname
RUN echo -n > /etc/mailname

CMD /usr/local/bin/entrypoint.sh