name             'jhdc-firewall'
maintainer       'Jeff Hutchison'
maintainer_email 'jeff@jeffhutchison.com'
license          'MIT'
description      'Installs/Configures firewall and fail2ban'
version          '0.4.1'
long_description <<EOT
jhdc-firewall
=============
This cookbook installs and configures firewall and fail2ban. It also provides
a LWRP for managing firewall ports.

Usage
-----

    firwall_port 993 do
      action: :add
    end

EOT

depends 'yum-epel'
