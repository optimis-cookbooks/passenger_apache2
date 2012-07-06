
default[:passenger][:version]     = "3.0.13"
default[:passenger][:max_pool_size] = "6"
default[:passenger][:root_path]   = "#{languages[:ruby][:gems_dir]}/gems/passenger-#{passenger[:version]}"
default[:passenger][:module_path] = "#{passenger[:root_path]}/ext/apache2/mod_passenger.so"

# rbenv integration
default[:passenger][:rbenv][:enabled] = false
default[:passenger][:rbenv][:version] = "ruby-1.9.2-p290-patched"
default[:passenger][:rbenv][:binary] = "/usr/local/rbenv/versions/ruby-1.9.2-p290-patched/bin/ruby"
default[:passenger][:rbenv][:root_path] = "/usr/local/rbenv/versions/ruby-1.9.2-p290-patched/lib/ruby/gems/1.9.1/gems/passenger-#{passenger[:version]}"
default[:passenger][:rbenv][:module_path] = "#{passenger[:rbenv][:root_path]}/ext/apache2/mod_passenger.so"
