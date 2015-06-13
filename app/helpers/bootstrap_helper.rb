module BootstrapHelper

  # --------- #
  # - ICONS - #
  # --------- #

  # Generates an icon.
  def bs_icon(icon, html_options = {})
    html_options = html_options.symbolize_keys
    classes = ['glyphicon']
    classes << "glyphicon-#{icon}"
    if html_options[:class]
      classes << html_options[:class]
    end
    html_options[:class] = classes * ' ' if classes.present?

    content_tag(:span, nil, html_options)
  end

  # ---------------- #
  # - LINK BUTTONS - #
  # ---------------- #

  # Generates a link button.
  def link_button(label = nil, options = nil, html_options = nil, &block)
    html_options, options, label = options, label, capture(&block) if block_given?

    html_options ||= {}
    html_options = html_options.symbolize_keys
    html_options = normalize_button_options_for_bootstrap(html_options)

    if (label_hidden = html_options.delete(:label_hidden)) && !block_given?
      label = content_tag :span, label, class: "hidden-#{label_hidden}"
    end

    if (icon = html_options.delete(:icon)) && !block_given?
      label = fa_icon(icon, text: label)
    end

    if html_options[:confirm]
      html_options[:'data-confirm'] = html_options.delete(:confirm)
    end

    if html_options[:disable_with]
      html_options[:'data-disable-with'] = html_options.delete(:disable_with)
    end

    link_to(label, options, html_options)
  end

  def new_button(label = nil, options = nil, html_options = {})
    button_options = { icon: 'plus', color: 'primary' }
    html_options = button_options.update html_options

    link_button(label, options, html_options)
  end

  # Generates a link show button.
  def show_button(label = nil, options = nil, html_options = {})
    button_options = { icon: 'search', color: 'info' }
    html_options = button_options.update html_options

    link_button(label, options, html_options)
  end

  # Generates a link edit button.
  def edit_button(label = nil, options = nil, html_options = {})
    button_options = { icon: 'edit', color: 'warning' }
    html_options = button_options.update html_options

    link_button(label, options, html_options)
  end

  # Generates a link destroy button.
  def destroy_button(label = nil, options = nil, html_options = {})
    button_options = { icon: 'trash', color: 'danger', method: :delete, confirm: 'Are you sure?' }
    html_options = button_options.update html_options

    link_button(label, options, html_options)
  end

  # Generates a link back button.
  def back_button(label = nil, options = nil, html_options = {})
    button_options = { icon: 'reply' }
    html_options = button_options.update html_options

    link_button(label, options, html_options)
  end

  # Generates a link cancel button.
  def cancel_button(label = nil, options = nil, html_options = {})
    button_options = { icon: 'ban' }
    html_options = button_options.update html_options

    link_button(label, options, html_options)
  end

  # ----------- #
  # - BUTTONS - #
  # ----------- #

  # Generates a button.
  def button(label = nil, html_options = nil, &block)
    html_options, label = label, capture(&block) if block_given?

    html_options ||= {}
    html_options = html_options.symbolize_keys
    html_options = normalize_button_options_for_bootstrap(html_options, :button)

    html_options[:type] ||= 'button'

    if (label_hidden = html_options.delete(:label_hidden)) && !block_given?
      label = content_tag :span, label, class: "hidden-#{label_hidden}"
    end

    if (icon = html_options.delete(:icon)) && !block_given?
      label = fa_icon(icon, text: label)
    end

    if html_options[:confirm]
      html_options[:'data-confirm'] = html_options.delete(:confirm)
    end

    if html_options[:disable_with]
      html_options[:'data-disable-with'] = html_options.delete(:disable_with)
    end

    button_tag(label, html_options)
  end

  # Generates a submit button.
  def submit_button(label = nil, html_options = {})
    button_options = { icon: 'check', color: 'primary', name: 'submit', type: 'submit' }
    html_options = button_options.update html_options

    button(label, html_options)
  end

  # Generates a reset button.
  def reset_button(label = nil, html_options = {})
    button_options = { icon: 'eraser', name: 'reset', type: 'reset' }
    html_options = button_options.update html_options

    button(label, html_options)
  end

  # Generates a radio buttons group
  def radio_buttons_group(html_options = nil, &block)
    # Set html_options
    html_options ||= {}
    html_options['data-toggle'] = 'buttons'
    html_options = html_options.symbolize_keys

    # Set html_options class
    classes = ['btn-group']
    classes << html_options[:class] if html_options[:class]
    html_options[:class] = classes * ' ' if classes.present?

    # Set radios options
    radios = []
    yield radios

    # Set radio input name
    name = html_options.delete(:name)

    # Set radio_items
    radio_items = []
    radios.each do |radio|
      radio_html_options = radio.symbolize_keys

      label = radio_html_options.delete(:label)

      if label_hidden = radio_html_options.delete(:label_hidden)
        label = content_tag :span, label, class: "hidden-#{label_hidden}"
      end

      if icon = radio_html_options.delete(:icon)
        label = fa_icon(icon, text: label)
      end

      value       = radio_html_options.delete(:value)
      radio_input = radio_button_tag(name, value, radio_html_options[:active])

      classes = ['btn', 'btn-default']
      classes << radio_html_options[:class] if radio_html_options[:class]
      classes << 'active' if radio_html_options.delete(:active)
      radio_html_options[:class] = classes * ' ' if classes.present?

      radio_item = label_tag value, radio_html_options do
        radio_input + ' ' + label
      end

      radio_items << radio_item
    end

    # Set output
    content_tag :div, html_options do
      (radio_items * '').html_safe
    end
  end

  # ---------- #
  # - IMAGES - #
  # ---------- #

  # Generates a responsive-friendly image tag
  def image_responsive(source, html_options = {})
    html_options = html_options.symbolize_keys

    classes = ['img-responsive']
    if html_options[:class]
      classes << html_options[:class]
    end

    html_options[:class] = classes * ' ' if classes.present?

    image_tag(source, html_options)
  end

  # Generates an image tag with rounded corners.
  def image_rounded(source, html_options = {})
    html_options = html_options.symbolize_keys

    classes = ['img-rounded']
    if html_options[:class]
      classes << html_options[:class]
    end

    html_options[:class] = classes * ' ' if classes.present?

    image_tag(source, html_options)
  end

  # Generates an image tag with circle.
  def image_circle(source, html_options = {})
    html_options = html_options.symbolize_keys

    classes = ['img-circle']
    if html_options[:class]
      classes << html_options[:class]
    end

    html_options[:class] = classes * ' ' if classes.present?

    image_tag(source, html_options)
  end

  # Generates an image tag within thumbnail.
  def image_thumbnail(source, html_options = {})
    html_options = html_options.symbolize_keys

    classes = ['img-thumbnail']
    if html_options[:class]
      classes << html_options[:class]
    end

    html_options[:class] = classes * ' ' if classes.present?

    image_tag(source, html_options)
  end

  # ------------ #
  # - OVERRIDE - #
  # ------------ #

  def content_tag(name, content_or_options_with_block = nil, options = nil, escape = true, &block)
    if block_given?
      if content_or_options_with_block.is_a?(Hash) || content_or_options_with_block.nil?
        options = content_or_options_with_block
        options ||= {}
        options = options.symbolize_keys
        options = normalize_options_for_typography(options)
      end
      content_tag_string(name, capture(&block), options, escape)
    else
      options ||= {}
      options = options.symbolize_keys
      options = normalize_options_for_typography(options)
      content_tag_string(name, content_or_options_with_block, options, escape)
    end
  end

  private

    def normalize_button_options_for_bootstrap(html_options = {}, type = :link)
      classes = ['btn']
      if color = html_options.delete(:color) { 'default' }
        classes << "btn-#{color}"
      end
      if size = html_options.delete(:size)
        classes << "btn-#{size}"
      end
      if block = html_options.delete(:block)
        classes << 'btn-block'
      end
      if active = html_options.delete(:active)
        classes << 'active'
      end
      if type == :link && html_options[:disabled]
        html_options.delete(:disabled)
        classes << 'disabled'
      end
      if html_options[:class]
        classes << html_options[:class]
      end

      html_options[:class] = classes * ' ' if classes.present?
      html_options
    end

    def normalize_options_for_typography(html_options = {})
      classes = []
      if pull = html_options.delete(:pull)
        classes << "pull-#{pull}"
      end
      if align = html_options.delete(:align)
        classes << "text-#{align}"
      end
      if transform = html_options.delete(:transform)
        classes << "text-#{transform}"
      end
      if color = html_options.delete(:color)
        classes << "text-#{color}"
      end
      if bgcolor = html_options.delete(:bgcolor)
        classes << "text-#{bgcolor}"
      end
      if html_options[:class]
        classes << html_options[:class]
      end

      html_options[:class] = classes * ' ' if classes.present?
      html_options
    end
end
