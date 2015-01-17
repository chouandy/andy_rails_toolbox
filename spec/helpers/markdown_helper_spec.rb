require "rails_helper"

RSpec.describe MarkdownHelper do

  describe "#markdown" do

    it "should get <h1> element" do
      rspec = helper.markdown '# Title'
      expected = %Q(<h1>Title</h1>\n)
      expect(rspec).to eq expected
    end

    it "should get <h2> element" do
      rspec = helper.markdown '## Title'
      expected = %Q(<h2>Title</h2>\n)
      expect(rspec).to eq expected
    end

    it "should get <h2> element" do
      rspec = helper.markdown '[an example](http://example.com/)'
      expected = %Q(<p><a href=\"http://example.com/\">an example</a></p>\n)
      expect(rspec).to eq expected
    end
  end
end
