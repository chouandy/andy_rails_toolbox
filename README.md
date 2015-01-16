# Andy Rails Toolbox

Andy Rails Toolbox includes many useful helpers for rails development.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'andy_rails_toolbox'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install andy_rails_toolbox

## Usage

#### HashHelper Examples

```
options = { a: '1', b: '2', c: '3' }

get_value(:a, options)
# => '1'
get_value(:d, options)
# => nil
get_value(:d, options, '4')
# => '4'

pop_value :a, options
# => '1'
# options = { b: '2', c: '3' }
pop_value :d, options
# => nil
pop_value :d, options, '4'
# => '4'
# options = { a: '1', b: '2', c: '3' }
```

#### TimeagoHelper

Add below codes to file `app/assets/javascripts/application.js

```
...
//= require jquery.timeago
//= require jquery.timeago.zh-TW
//= require jquery.timeago.load
...
```

Use in View

```
<%= timeago('2014-11-21 09:38:27.256503') %>
=> '2個月之前'
```

## Contributing

1. Fork it ( https://github.com/ChouAndy/andy_rails_toolbox/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
