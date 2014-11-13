name 'old-passenger_apache2'

maintainer        "Mike Adolphs"
maintainer_email  "mike@fooforge.com"
license           "Apache 2.0"
description       "Installs passenger for Apache2"
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           "0.1.0"

recipe "passenger", "Installs Passenger as an Apache module"
recipe "passenger::mod_rails", "Enables Apache module configuration for passenger module"

depends "apache2", ">= 1.0.4"
depends "build-essential"
depends "rbenv"

%w{ redhat centos ubuntu debian arch }.each do |os|
  supports os
end
