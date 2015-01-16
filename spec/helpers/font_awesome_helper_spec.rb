require "rails_helper"

RSpec.describe FontAwesomeHelper do

  describe "#fa_icon" do

    it "can get a icon element" do
      expect(helper.fa_icon 'user').to eq %Q(<i class=\"fa fa-user\"></i>)
    end

    it "can get a left icon element with text" do
      expect(helper.fa_icon 'user', text: 'Login').to eq %Q(<i class=\"fa fa-user\"></i> Login)
    end

    it "can get a right icon element with text" do
      expect(helper.fa_icon 'user', text: 'Login', right: true).to eq %Q(Login <i class=\"fa fa-user\"></i>)
    end

    it "can get a 4x icon element" do
      expect(helper.fa_icon 'user 4x').to eq %Q(<i class=\"fa fa-user fa-4x\"></i>)
    end
  end
end
