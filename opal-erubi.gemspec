$LOAD_PATH << File.expand_path('../lib', __FILE__)
require 'opal/erubi/version'

Gem::Specification.new do |s|
  s.name         = 'opal-erubi'
  s.version      = Opal::Erubi::VERSION
  s.author       = 'ahmadine'
  s.email        = '54514036+ahmadine@users.noreply.github.com'
  s.homepage     = 'https://github.com/ahmadine/opal-erubi'
  s.summary      = 'Run Erubi templates client-side with Opal'
  s.description  = 'Run Erubi templates client-side with Opal.'
  s.license      = 'MIT'

  s.files          = `git ls-files`.split("\n")
  s.executables    = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.test_files     = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths  = ['lib']

  s.add_dependency 'opal', ['>= 0.11', '< 2']
  s.add_dependency 'erubi'

  s.add_development_dependency 'opal-rspec'
  s.add_development_dependency 'opal-sprockets' #for RSpec
  s.add_development_dependency 'rake'
end