
source 'https://rubygems.org'
gemspec

gem "opal-rspec", "> 0.6.2"

if File.exist? "../opal"
  gem "opal", path: "../opal"
else
  gem "opal"
end

if File.exist? "../opal-sprockets"
  gem "opal-sprockets", path: "../opal-sprockets"
end

gem "erubi"

gem "pry"
