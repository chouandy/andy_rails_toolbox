# Andy Rails Toolbox [![Gem Version](https://badge.fury.io/rb/andy_rails_toolbox.svg)](http://badge.fury.io/rb/andy_rails_toolbox)

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

``` ruby
bs_icon 'user'
# => <span class="glyphicon glyphicon-user"></span>
```

BUTTONS

``` ruby
link_button 'link_label', '/'
# => <a class="btn btn-default" href="/">link_label</a>
link_button 'link_label', '/', color: 'primary'
# => <a class="btn btn-primary" href="/">link_label</a>
link_button 'link_label', '/', size: 'sm'
# => <a class="btn btn-default btn-sm" href="/">link_label</a>
link_button 'link_label', '/', block: true
# => <a class="btn btn-default btn-block" href="/">link_label</a>
link_button 'link_label', '/', active: true
# => <a class="btn btn-default active" href="/">link_label</a>
link_button 'link_label', '/', disabled: true
# => <a class="btn btn-default disabled" href="/">link_label</a>
link_button 'link-button', '/', class: 'preset-class'
# => <a class="btn btn-default preset-class" href="/">link_label</a>
link_button 'link-button', '/', label_hidden: 'xs'
# => <a class="btn btn-default" href="/"><span class="hidden-xs">link_label</span></a>
link_button 'link_label', '/', icon: 'user'
# => <a class="btn btn-default" href="/"><i class="fa fa-user"></i> link_label</a>
button 'button'
# => <button name="button" type="button" class="btn btn-default">button</button>
submit_button 'submit'
# => <button name="submit" type="submit" class="btn btn-primary"><i class="fa fa-check"></i> submit</button>
reset_button 'reset'
# => <button name="reset" type="reset" class="btn btn-default"><i class="fa fa-eraser"></i> reset</button>
```

IMAGES

``` ruby
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

``` ruby
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

``` ruby
qrcode 'Hello world!'
```

<img alt="Hello world!" src="https://chart.googleapis.com/chart?cht=qr&amp;chl=Hello world!&amp;chs=200x200" />

QRCode options parameters: <a href="https://google-developers.appspot.com/chart/infographics/docs/qr_codes#overview" target="_blank">Here</a>

``` ruby
qrcode 'Hello world!', width: '300', output_encoding: 'Shift_JIS', error_correction_level: 'H', margin: '10'
```

#### FontAwesomeHelper

Font Awesome icons Homepage: <a href="http://fortawesome.github.io/Font-Awesome/" target="_blank">http://fortawesome.github.io/Font-Awesome/</a>

In your `application.css`, include the css file:

```css
/*
 *= require font-awesome
 */
```
Then restart your webserver if it was previously running

Examples

``` ruby
fa_icon "user"
# => <i class="fa fa-user"></i>

fa_icon "user", text: "Login"
# => <i class="fa fa-user"></i> Login

fa_icon "user", text: "Login", right: true
# => Login <i class="fa fa-user"></i>

fa_icon "user 4x"
# => <i class="fa fa-user fa-4x"></i>
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

``` ruby
timeago '2014-11-21 09:38:27.256503'
# => '2個月之前'
```

## Contributing

1. Fork it ( https://github.com/ChouAndy/andy_rails_toolbox/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
