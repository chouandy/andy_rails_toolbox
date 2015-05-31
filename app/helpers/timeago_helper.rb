module TimeagoHelper
  def timeago(time = nil, html_options = {})
    time = time.to_time if time.is_a? String
    classes = ['timeago']
    if html_options[:class]
      classes << html_options[:class]
    end
    html_options[:class] = classes * ' '
    html_options[:title] = time.getutc.iso8601
    content_tag(:abbr, time.try(:to_s), html_options)
  end
end
