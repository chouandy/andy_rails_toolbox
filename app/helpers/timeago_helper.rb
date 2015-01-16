module TimeagoHelper
  def timeago(time, options = {})
    time = time.to_time if time.is_a? String
    options[:class] ||= 'timeago'
    content_tag(:abbr, time.to_s, options.merge(title: time.getutc.iso8601)) if time
  end
end
