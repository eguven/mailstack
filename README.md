## mailstack ##

### About ###

Script to install Ubuntu + PostgreSQL + Postfix + Dovecot + Amavis + ClamAV + SpamAssassin (and
optionally RoundCube(-psql)) and set them up to work together. This setup is useful
when you need to run a mailserver for virtual users and subdomains (adding domains and
new e-mail accounts through PSQL insert)

It roughly follows [this tutorial](http://flurdy.com/docs/postfix/) and adapts it to
PSQL and Dovecot instead of MySQL and Courier.

### Important Note ###
Only tested and used on Ubuntu 11.04. **Test in development** and check the scripts to
make sure everything looks good.

### Author ###

Eren Güven [Twitter](https://twitter.com/cyberfart)

### Files ###

+ README.md - This file
+ installscript - Installer for everything except Webmail
+ roundcube_script - Install and configuration script for Roundcube
+ postfix_main_append - Postfix main.cf configuration additions
+ postfix_master_append - Postfix master.cf configuration additions
+ dovecot_replace - Dovecot configuration (/etc/docevot/dovecot.conf replacement)
+ amavis_50-user_replace - Amavis configuration (/etc/amavis/conf.d/50-user replacement)
+ pgsql_setup.sql - PostgreSQL setup file for Postfix/Dovecot connection (domains, users, aliases)
+ fullcleanerscript - Purge script (for development and **testing ONLY**)
+ extras/dev_pgsql_example - PostgreSQL example data
+ extras/add_custom_bounce_messages - Installs the template in this folder
+ extras/bounce_template.cf - Bounce template

### Installation ###

make appropriate changes in **installscript** CONFIG CONSTANTS section

    sudo ./installscript

make appropriate changes in **roundcube_script** and update roundcube_logo.png if desired

    sudo ./roundcube_script
