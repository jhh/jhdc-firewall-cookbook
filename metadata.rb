name             'jhdc-firewall'
maintainer       'Jeff Hutchison'
maintainer_email 'jeff@jeffhutchison.com'
license          'Apache v2.0'
description      'Installs/Configures firewall and fail2ban'
source_url       'https://github.com/jhh/jhdc-firewall-cookbook'
issues_url       'https://github.com/jhh/jhdc-firewall-cookbook/issues'
version          '0.6.2'

long_description <<EOT
jhdc-firewall
=============
This cookbook installs and configures firewall and fail2ban.
EOT

depends 'yum-epel'
