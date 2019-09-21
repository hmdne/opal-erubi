# Opal Erubi

*Erubi templates for Opal*

This gem adds `.erubi` files to precompile templates for opal. This gem does
not make the Erubi compiler available under opal, just the result of
pre-compiling an Erubi template.

A micro runtime is included to handle escaping.

All Erubi templates become available under the `Template` constant in Opal,
which allows a template to be easily rendered in a context:

```ruby
Template['user'].render(my_user)
# => <div>..</div>
```

This code is related to an opal-haml gem. It's mostly compatible, but it doesn't
include sprockets support by default. Since Erubi is most likely to be used in a
Roda stack which uses just Tilt to render assets this shouldn't be of any issue.
Including sprockets support is as simple as doing `include "opal/erubi/processor"`.

This code is opinionated - it assumes that you want to run it in an "escape: true"
mode.

## Usage

Add opal-erubi to your `Gemfile`:

```ruby
gem 'opal-erubi', github: 'ahmadine/opal-erubi'
```

Create an erubi file in the opal load path (e.g. `app/user_template.erubi`):

```erb
<div class="row">
  <div class="col-md-6">
    <%= self.name %>
  </div>
  <div class="col-md-6">
    <%= self.age %>
  </div>
</div>
```

Render the erubi template:

```ruby
# app/application.rb
require 'user_template'

class User
  attr_accessor :name, :age

  def initialize(name, age)
    @name, @age = name, age
  end
end

user = User.new('Ford Prefect', 42)
html = Template['user_template'].render(user)
puts html
# => <div class="row">...</div>
```

## Running tests

Get dependencies:

```
$ bundle install
```

Run tests using opal-rspec:

```
$ bundle exec rake
```

Run specs in the browser:

```
$ bundle exec rackup
```

## License

This gem contains adapted parts from opal-haml.

(The MIT License)

Copyright (C) 2019 by ahmadine

opal-haml: Copyright (C) 2013 by Adam Beynon, 2015 Elia Schito

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.


