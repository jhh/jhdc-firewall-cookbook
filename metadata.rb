name             'jhdc-firewall'
maintainer       'Jeff Hutchison'
maintainer_email 'jeff@jeffhutchison.com'
license          'MIT'
description      'Installs/Configures firewall and fail2ban'
version          '0.5.0'
long_description <<EOT
jhdc-firewall
=============
This cookbook installs and configures firewall and fail2ban.
EOT

depends 'yum-epel'
