name             'apt-mirror'
maintainer       'Richard Murray'
maintainer_email 'rich.j.murray@gmail.com'
license          'Apache 2.0'
description      'Installs/Configures apt-mirror'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.2'

supports         'ubuntu'

depends          'nginx'