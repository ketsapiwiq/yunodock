nslcd
unscd
slapd
metronome
php7.4-fpm
mariadb-server
metronome


# function register_debconf() {
#     debconf-set-selections << EOF
# slapd slapd/password1 password yunohost
# slapd slapd/password2 password yunohost
# slapd slapd/domain    string yunohost.org
# slapd shared/organization     string yunohost.org
# slapd	slapd/allow_ldap_v2	boolean	false
# slapd	slapd/invalid_config	boolean	true
# slapd	slapd/backend	select	MDB
# postfix postfix/main_mailer_type        select Internet Site
# postfix postfix/mailname string /etc/mailname
# nslcd	nslcd/ldap-bindpw	password
# nslcd	nslcd/ldap-starttls	boolean	false
# nslcd	nslcd/ldap-reqcert	select
# nslcd	nslcd/ldap-uris	string	ldap://localhost/
# nslcd	nslcd/ldap-binddn	string
# nslcd	nslcd/ldap-base	string	dc=yunohost,dc=org
# libnss-ldapd    libnss-ldapd/nsswitch multiselect group, passwd, shadow
# postsrsd postsrsd/domain string yunohost.org
# EOF
# }
