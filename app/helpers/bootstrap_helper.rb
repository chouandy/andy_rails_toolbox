module BootstrapHelper

  # --------- #
  # - ICONS - #
  # --------- #

  # Generates an icon.
  def bs_icon(icon, html_options = {})
    html_options = html_options.stringify_keys
    classes = ['glyphicon']
    classes << "glyphicon-#{icon}"
    if preset_class = html_options.delete('class')
      classes << preset_class
    end
    html_options['class'] = classes * ' '

    content_tag(:span, nil, html_options)
  end

  # ---------------- #
  # - LINK BUTTONS - #
  # ---------------- #

  # Generates a link button.
  def link_button(label = nil, options = nil, html_options = nil, &block)
    html_options, options, label = options, label, capture(&block) if block_given?

    html_options ||= {}
    html_options = html_options.stringify_keys
    html_options = normalize_button_options_for_bootstrap(html_options)

    if (label_hidden = html_options.delete('label_hidden')) && !block_given?
      label = content_tag :span, label, class: "hidden-#{label_hidden}"
    end

    if (icon = html_options.delete('icon')) && !block_given?
      label = fa_icon(icon, text: label)
    end

    if html_options['confirm']
      html_options['data-confirm'] = html_options.delete('confirm')
    end

    if html_options['disable_with']
      html_options['data-disable-with'] = html_options.delete('disable_with')
    end

    link_to(label, options, html_options)
  end

  def new_button(label = nil, options = nil, html_options = nil)
    button_options = { icon: 'plus', color: 'primary' }
    html_options ||= {}
    html_options.update button_options

    link_button(label, options, html_options)
  end

  # Generates a link show button.
  def show_button(label = nil, options = nil, html_options = nil)
    button_options = { icon: 'search', color: 'info' }
    html_options ||= {}
    html_options.update button_options

    link_button(label, options, html_options)
  end

  # Generates a link edit button.
  def edit_button(label = nil, options = nil, html_options = nil)
    button_options = { icon: 'edit', color: 'warning' }
    html_options ||= {}
    html_options.update button_options

    link_button(label, options, html_options)
  end

  # Generates a link destroy button.
  def destroy_button(label = nil, options = nil, html_options = nil)
    button_options = { icon: 'trash', color: 'danger', method: :delete, confirm: 'Are you sure?' }
    html_options ||= {}
    html_options.update button_options

    link_button(label, options, html_options)
  end

  # Generates a link back button.
  def back_button(label = nil, options = nil, html_options = nil)
    button_options = { icon: 'reply' }
    html_options ||= {}
    html_options.update button_options

    link_button(label, options, html_options)
  end

  # Generates a link cancel button.
  def cancel_button(label = nil, options = nil, html_options = nil)
    button_options = { icon: 'ban' }
    html_options ||= {}
    html_options.update button_options

    link_button(label, options, html_options)
  end

  # ----------- #
  # - BUTTONS - #
  # ----------- #

  # Generates a button.
  def button(label = nil, html_options = nil, &block)
    html_options, label = label, capture(&block) if block_given?

    html_options ||= {}
    html_options = html_options.stringify_keys
    html_options = normalize_button_options_for_bootstrap(html_options, :button)

    html_options['type'] ||= 'button'

    if (label_hidden = html_options.delete('label_hidden')) && !block_given?
      label = content_tag :span, label, class: "hidden-#{label_hidden}"
    end

    if (icon = html_options.delete('icon')) && !block_given?
      label = fa_icon(icon, text: label)
    end

    if html_options['confirm']
      html_options['data-confirm'] = html_options.delete('confirm')
    end

    if html_options['disable_with']
      html_options['data-disable-with'] = html_options.delete('disable_with')
    end

    button_tag(label, html_options)
  end

  # Generates a submit button.
  def submit_button(label = nil, html_options = nil)
    button_options = { icon: 'check', color: 'primary', name: 'submit', type: 'submit' }
    html_options ||= {}
    html_options.update button_options

    button(label, html_options)
  end

  # Generates a reset button.
  def reset_button(label = nil, html_options = nil)
    button_options = { icon: 'eraser', name: 'reset', type: 'reset' }
    html_options ||= {}
    html_options.update button_options

    button(label, html_options)
  end

  # ---------- #
  # - IMAGES - #
  # ---------- #

  # Generates a responsive-friendly image tag
  def image_responsive(source, options = {})
    add_css_class 'img-responsive', options
    image_tag source, options
  end

  # Generates an image tag with rounded corners.
  def image_rounded(source, options = {})
    add_css_class 'img-rounded', options
    image_tag source, options
  end

  # Generates an image tag with circle.
  def image_circle(source, options = {})
    add_css_class 'img-circle', options
    image_tag source, options
  end

  # Generates an image tag within thumbnail.
  def image_thumbnail(source, options = {})
    add_css_class 'img-thumbnail', options
    image_tag source, options
  end

  # ------------ #
  # - OVERRIDE - #
  # ------------ #

  # override rails helper: content_tag
  def content_tag(name, content_or_options_with_block = nil, options = nil, escape = true, &block)
    if block_given?
      options = content_or_options_with_block if content_or_options_with_block.is_a? Hash
      normalize_typography_options(options) if options
      content_tag_string name, capture(&block), options, escape
    else
      normalize_typography_options(options) if options
      content_tag_string name, content_or_options_with_block, options, escape
    end
  end

  private

  def normalize_button_options_for_bootstrap(html_options = {}, type = :link)
    classes = ['btn']
    if color = html_options.delete('color')
      classes << "btn-#{color}"
    else
      classes << 'btn-default'
    end
    if size = html_options.delete('size')
      classes << "btn-#{size}"
    end
    if block = html_options.delete('block')
      classes << 'btn-block'
    end
    if active = html_options.delete('active')
      classes << 'active'
    end
    if type == :link && html_options['disabled']
      html_options.delete('disabled')
      classes << 'disabled'
    end
    if preset_class = html_options.delete('class')
      classes << preset_class
    end

    html_options['class'] = classes * ' '
    html_options
  end

  # ------------- #
  # - UTILITIES - #
  # ------------- #

  # Appends new class names to the given options.
  def add_css_class(class_names, options)
    class_names = class_names.to_s if class_names.is_a? Symbol
    class_names = class_names.split if class_names.is_a? String
    if symbolize_keys(options).key? :class
      options_class_names = options[:class].split
      class_names.each do |value|
        options_class_names << %(#{value.strip}) unless options_class_names.include? value
      end
      class_names = options_class_names
    end
    options[:class] = %(#{class_names * ' '})
  end

  # Adds the pull class to the given options is applicable.
  def add_pull_class(options)
    pull = pop_value :pull, options
    add_css_class(%(pull-#{pull}), options) if pull
  end

  # Adds the text align class to the given options if applicable.
  def add_align_class(options)
    align = pop_value :align, options
    add_css_class(%(text-#{align}), options) if align
  end

  # Adds the text transform class to the given options if applicable.
  def add_transform_class(options)
    transform = pop_value :transform, options
    add_css_class(%(text-#{transform}), options) if transform
  end

  # Adds the color to the given options if applicable.
  def add_color_class(options)
    color = pop_value :color, options
    add_css_class(%(text-#{color}), options) if color
  end

  # Adds the bgcolor to the given options if applicable.
  def add_bgcolor_class(options)
    bgcolor = pop_value :bgcolor, options
    add_css_class(%(bg-#{bgcolor}), options) if bgcolor
  end

  # Adds the active to the given options if applicable.
  def add_active_class(options)
    active = pop_value :active, options
    add_css_class('active', options) if active
  end

  def normalize_typography_options(options)
    add_pull_class options
    add_align_class options
    add_transform_class options
    add_color_class options
    add_bgcolor_class options
  end
end
