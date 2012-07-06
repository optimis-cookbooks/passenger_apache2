Description
====

Installs passenger for Apache 2. Please note: This is a fork of the original passenger2_apache cookbook written by Opscode which includes support for rbenv. Although it works for me in my environment it might break within yours. Please make your checks before using this cookbook. Otherwise you might end up with passenger running on system Ruby 1.8.7 instead of running the latest ruby build installed by rbenv.

Requirements
====

## Platform

Tested on Ubuntu 10.04 and on Debian 6.0.5 (Squeeze)

## Cookbooks

Opscode cookbooks:

* apache2
* build-essential
* rbenv

Attributes 
====

* `passenger[:version]` - Specify the version of passenger to install.
* `passenger[:max_pool_size]` - Sets PassengerMaxPoolSize in the Apache module config.
* `passenger[:root_path]` - The location of the passenger gem.
* `passenger[:module_path]` - The location of the compiled passenger apache module.

* `default[:passenger][:rbenv][:enabled] = false`
* `default[:passenger][:rbenv][:version] = "ruby-1.9.3"`
* `default[:passenger][:rbenv][:binary] = "/usr/local/rbenv/versions/#{passenger[:rbenv][:version]}/bin/ruby"`
* `default[:passenger][:rbenv][:root_path] = "/usr/local/rbenv/versions/#{passenger[:rbenv][:version]}/lib/ruby/gems/1.9.1/gems/passenger-#{passenger[:version]}"`
* `default[:passenger][:rbenv][:module_path] = "#{passenger[:rbenv][:root_path]}/ext/apache2/mod_passenger.so}"`

Recipes
=======

default
-------
Installs the passenger gem.

mod_rails
---------
Installs the passenger gem and enables the module in Apache2.

Usage
====

For example, to run a Rails application on passenger:

    include_recipe "rails"
    include_recipe "passenger_apache2"
    
    web_app "myproj" do
      docroot "/srv/myproj/public"
      server_name "myproj.#{node[:domain]}"
      server_aliases [ "myproj", node[:hostname] ]
      rails_env "production"
    end

A sample config template is provided, `web_app.conf.erb`. If this is suitable for your application, add 'cookbook "passenger"' to the define above to use that template. Otherwise, copy the template to the cookbook where you're using `web_app`, and modify as needed. The cookbook parameter is optional, if omitted it will search the cookbook where the define is used.

License and Author
====

Author:: Joshua Timberman (<joshua@opscode.com>)
Author:: Joshua Sierles (<joshua@37signals.com>)
Author:: Michael Hale (<mikehale@gmail.com>)
Author:: Mike Adolphs (<mike@fooforge.com)

Copyright:: 2009, Opscode, Inc
Copyright:: 2009, 37signals
Coprighty:: 2009, Michael Hale
Copyright:: 2012, Mike Adolphs

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
