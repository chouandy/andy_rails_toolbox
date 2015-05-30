require 'rails_helper'

RSpec.describe QrcodeHelper do

  describe "#qrcode" do

    it "should get a qrcode <img> element" do
      rspec = helper.qrcode 'Hello world!'
      expected = %Q(<img alt=\"Hello world!\" src=\"https://chart.googleapis.com/chart?cht=qr&amp;chl=Hello world!&amp;chs=200x200\" />)
      expect(rspec).to eq expected
    end

    it "should get a qrcode <img> element with all parameters" do
      rspec = helper.qrcode 'Hello world!', width: '300', output_encoding: 'Shift_JIS', error_correction_level: 'H', margin: '10'
      expected = %Q(<img alt=\"Hello world!\" src=\"https://chart.googleapis.com/chart?cht=qr&amp;chl=Hello world!&amp;chs=300x300&amp;choe=Shift_JIS&amp;chld=H|10\" />)
      expect(rspec).to eq expected
    end
  end
end
