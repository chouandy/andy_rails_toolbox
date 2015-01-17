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

#### BootstrapHelper

Bootstrap Homepage: <a href="http://getbootstrap.com/" target="_blank">http://getbootstrap.com/</a>


Add below codes to layout `app/views/layout/application.html.erb`

``` erb
...
<%= stylesheet_link_tag '//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css' %>
...
<%= javascript_include_tag '//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js' %>
...
```

Examples

ICONS

``` rb
bs_icon 'user'
# => <span class="glyphicon glyphicon-user"></span>
```

BUTTONS

``` rb
html_button 'button'
# => <button name="button" type="button" class="btn btn-default">button</button>
html_button 'button', color: 'primary'
# => <button name="button" type="button" class="btn btn-primary">button</button>
html_button 'button', size: 'sm'
# => <button name="button" type="button" class="btn btn-default btn-sm">button</button>
html_button 'button', block: true
# => <button name="button" type="button" class="btn btn-default btn-block">button</button>
html_button 'button', icon: 'user'
# => <button name="button" type="button" class="btn btn-default"><i class="fa fa-user"></i> button</button>
html_button 'button', active: true
# => <button name="button" type="button" class="btn btn-default active">button</button>
submit_button 'submit'
# => <button type="submit" class="btn btn-default">submit</button>
reset_button 'reset'
# => <button type="reset" class="btn btn-default">reset</button>
link_button 'link', url: root_path
# => <a class="btn btn-default" role="button" href="/">link</a>
input_button 'input button'
# => <input class="btn btn-default" value="input button" type="button" />
input_submit 'input button'
# => <input type="submit" name="commit" value="input button" class="btn btn-default" />
```

IMAGES

``` rb
image_responsive 'pic.png'
# => <img class="img-responsive" src="/images/pic.png" alt="Pic" />
image_rounded 'pic.png'
# => <img class="img-rounded" src="/images/pic.png" alt="Pic" />
image_circle 'pic.png'
# => <img class="img-circle" src="/images/pic.png" alt="Pic" />
image_thumbnail 'pic.png'
# => <img class="img-thumbnail" src="/images/pic.png" alt="Pic" />
```

#### MarkdownHelper

New a css erb file `app/assets/stylesheets/pygments.css.erb` for pygments color style

``` erb
<%= Pygments.css(style: "igor") %>
```

All styles:

``` sh
$ rails c
# => Loading development environment (Rails 4.2.0)
irb(main):001:0> require 'pygments.rb'
# => true
irb(main):002:0> Pygments.styles
# => ["manni", "igor", "xcode", "vim", "autumn", "vs", "rrt", "native", "perldoc", "borland", "tango", "emacs", "friendly", "monokai", "paraiso-dark", "colorful", "murphy", "bw", "pastie", "paraiso-light", "trac", "default", "fruity"]
```

Examples

``` rb
markdown '# h1'
# => <h1>h1</h1>
markdown '## h2'
# => <h2>h2</h2>
markdown '[an example](http://example.com/)'
# => <p><a href="http://example.com/">an example</a></p>
markdown @post.content
# => transform markdown code to html codes and payments highlighter
```

#### QrcodeHelper Examples

``` rb
qrcode 'Hello world!'
```

<img alt="Hello world!" src="https://chart.googleapis.com/chart?cht=qr&amp;chl=Hello world!&amp;chs=200x200" />

QRCode options parameters: <a href="https://google-developers.appspot.com/chart/infographics/docs/qr_codes#overview" target="_blank">Here</a>

``` rb
qrcode 'Hello world!', width: '300', output_encoding: 'Shift_JIS', error_correction_level: 'H', margin: '10'
```

#### FontAwesomeHelper

Font Awesome icons Homepage: <a href="http://fortawesome.github.io/Font-Awesome/" target="_blank">http://fortawesome.github.io/Font-Awesome/</a>

Add below codes to layout `app/views/layout/application.html.erb`

``` erb
...
<%= stylesheet_link_tag '//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css' %>
...
```

Examples

``` rb
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

``` rb
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

``` js
...
//= require jquery.timeago
//= require jquery.timeago.zh-TW
//= require jquery.timeago.load
...
```

Use in View

``` rb
timeago '2014-11-21 09:38:27.256503'
# => '2個月之前'
```

## Contributing

1. Fork it ( https://github.com/ChouAndy/andy_rails_toolbox/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
