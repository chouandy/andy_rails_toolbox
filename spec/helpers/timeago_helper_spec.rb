require "rails_helper"

RSpec.describe TimeagoHelper do
  describe "#timeago" do
    it "should get a <abbr> element" do
      expect(helper.timeago '2014-09-09').to eq %Q(<abbr class=\"timeago\" title=\"2014-09-08T16:00:00Z\">2014-09-09 00:00:00 +0800</abbr>)
    end
  end
end
