module QrcodeHelper
  def qrcode(data = '', options = {})
    # Google API: https://google-developers.appspot.com/chart/infographics/docs/qr_codes
    width                  = options.delete(:width) { '200' }
    output_encoding        = options.delete(:output_encoding)
    error_correction_level = options.delete(:error_correction_level)
    margin                 = options.delete(:margin)

    qrcode_url = 'https://chart.googleapis.com/chart?cht=qr'
    qrcode_url += "&chl=#{data}"
    qrcode_url += "&chs=#{width}x#{width}"
    qrcode_url += "&choe=#{output_encoding}" if output_encoding
    if error_correction_level && margin
      qrcode_url += "&chld=#{error_correction_level}|#{margin}"
    else
      qrcode_url += "&chld=#{error_correction_level}" if error_correction_level
      qrcode_url += "&chld=|#{margin}" if margin
    end
    image_tag(qrcode_url, alt: data)
  end
end
