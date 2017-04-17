##########################################################################
# >> Start Daemons
##########################################################################


cron
/etc/init.d/rsyslog start
/etc/init.d/saslauthd start
/etc/init.d/fail2ban start
/etc/init.d/opendkim start
/etc/init.d/opendmarc start
/etc/init.d/postfix start

/usr/sbin/dovecot -c /etc/dovecot/dovecot.conf
/usr/sbin/dovecot reload

freshclam
/etc/init.d/fetchmail start
/etc/init.d/clamav-daemon start
/etc/init.d/postgrey start
/etc/init.d/amavis start
