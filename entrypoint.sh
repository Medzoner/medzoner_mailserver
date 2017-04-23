#/bin/bash

touch /etc/mailname

cron

service rsyslog start
service saslauthd start
service fail2ban start
service opendkim start
service opendmarc start
service postfix start

/usr/sbin/dovecot -c /etc/dovecot/dovecot.conf
/usr/sbin/dovecot reload

freshclam
service fetchmail start
service clamav-daemon start
service postgrey start
service amavis start