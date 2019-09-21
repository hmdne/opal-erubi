
require 'bundler'
Bundler.require

require 'opal-sprockets'
require 'opal-rspec'
require 'opal/erubi/processor' # Sprockets support

sprockets_env = Opal::RSpec::SprocketsEnvironment.new(
  spec_pattern         = 'spec-opal/**/*_spec.{rb,opal}',
  spec_exclude_pattern = nil,
  spec_files           = nil,
  default_path         = 'spec-opal')

run Opal::Sprockets::Server.new(sprockets: sprockets_env) { |s|
  s.main = 'opal/rspec/sprockets_runner'
  s.append_path 'spec-opal'
  s.debug = true
}