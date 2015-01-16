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

#### QrcodeHelper Examples

```
qrcode 'Hello world!'
```

<img alt="Hello world!" src="https://chart.googleapis.com/chart?cht=qr&amp;chl=Hello world!&amp;chs=200x200" />

QRCode options parameters: <a href="https://google-developers.appspot.com/chart/infographics/docs/qr_codes#overview" target="_blank">Here</a>

```
qrcode 'Hello world!', width: '300', output_encoding: 'Shift_JIS', error_correction_level: 'H', margin: '10'
```

#### FontAwesomeHelper

Font Awesome icons Homepage: http://fortawesome.github.io/Font-Awesome/

Add below codes to layout `app/views/layout/application.html.erb`

```
...
<%= stylesheet_link_tag '//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css' %>
...
```

Examples

```
fa_icon "user"
# => <i class="fa fa-user"></i>

fa_icon "user", text: "Login"
# => <i class="fa fa-user"></i> Login

fa_icon "user", text: "Login", right: true
# => Login <i class="fa fa-user"></i>

fa_icon "user 4x"
# => <i class="fa fa-user fa-4x"></i>
```

#### HashHelper Examples

```
options = { a: '1', b: '2', c: '3' }

get_value :a, options
# => '1'
get_value :d, options
# => nil
get_value :d, options, '4'
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

Add below codes to file `app/assets/javascripts/application.js`

```
...
//= require jquery.timeago
//= require jquery.timeago.zh-TW
//= require jquery.timeago.load
...
```

Use in View

```
timeago '2014-11-21 09:38:27.256503'
=> '2個月之前'
```

## Contributing

1. Fork it ( https://github.com/ChouAndy/andy_rails_toolbox/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
