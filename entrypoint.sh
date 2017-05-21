#/bin/bash

touch /etc/mailname

service rsyslog start
service saslauthd start
service fail2ban start
service opendkim start
service opendmarc start
service postfix start

/usr/sbin/dovecot -c /etc/dovecot/dovecot.conf
/usr/sbin/dovecot reload

service fetchmail start
service postgrey start
service amavis start