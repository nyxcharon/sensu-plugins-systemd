Gem::Specification.new do |s|
  s.authors                = ['Sensu-Plugins and contributors']
  s.cert_chain             = ['certs/sensu-plugins.pem']
  s.date                   = '2016-02-11'
  s.description            = 'Sensu systemd plugins'
  s.email                  = '<sensu-users@googlegroups.com>'
  s.executables            = Dir.glob('bin/**/*.rb').map { |file| File.basename(file) }
  s.files                  = Dir.glob('{bin,lib}/**/*') + %w(LICENSE README.md CHANGELOG.md)
  s.homepage               = 'https://github.com/nyxcharon/sensu-plugins-systemd'
  s.license                = 'MIT'
  s.metadata               = { 'maintainer'         => 'sensu-plugin',
                               'development_status' => 'active',
                               'production_status'  => 'unstable - testing recommended',
                               'release_draft'      => 'false',
                               'release_prerelease' => 'false'
                              }
  s.name                   = 'sensu-plugins-systemd'
  s.platform               = Gem::Platform::RUBY
  s.post_install_message   = 'You can use the embedded Ruby by setting EMBEDDED_RUBY=true in /etc/default/sensu'
  s.require_paths          = ['lib']
  s.required_ruby_version  = '>= 1.9.3'
  s.signing_key            = File.expand_path(pvt_key) if $PROGRAM_NAME =~ /gem\z/
  s.summary                = 'Sensu plugins for systemd'
  s.test_files             = s.files.grep(%r{^(test|spec|features)/})
  s.version                = '0.0.1'

  s.add_runtime_dependency 'sensu-plugin',      '1.2.0'
  s.add_runtime_dependency 'systemd-bindings', '0.0.1.1'


  s.add_development_dependency 'bundler',                   '~> 1.7'
  s.add_development_dependency 'rubocop',                   '0.32.1'
  s.add_development_dependency 'rspec',                     '~> 3.1'
  s.add_development_dependency 'yard',                      '~> 0.8'
end
