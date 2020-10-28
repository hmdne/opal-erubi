require 'bundler'
Bundler.require
Bundler::GemHelper.install_tasks
require 'opal/erubi/processor' # Sprockets support

require 'opal/rspec/rake_task'
Opal::RSpec::RakeTask.new(:default) do |_, task|
  task.default_path = 'spec-opal'
  task.pattern = 'spec-opal/**/*_spec.{rb,opal}'
end
