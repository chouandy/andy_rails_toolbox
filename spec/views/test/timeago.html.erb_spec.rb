require "rails_helper"

RSpec.describe "test/timeago" do
  context "uses TimeagoHelper" do
    it "should get a <abbr> element" do
      render
      expect(rendered).to match %Q(<abbr class="timeago" title="2014-11-21T01:38:27Z">2014-11-21 09:38:27 +0800</abbr>\n)
    end
  end
end
