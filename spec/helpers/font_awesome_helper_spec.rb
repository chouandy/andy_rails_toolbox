require "rails_helper"

RSpec.describe FontAwesomeHelper do

  describe "#fa_icon" do

    it "can get a icon element" do
      rspec = helper.fa_icon 'user'
      expected = %Q(<i class=\"fa fa-user\"></i>)
      expect(rspec).to eq expected
    end

    it "can get a left icon element with text" do
      rspec = helper.fa_icon 'user', text: 'Login'
      expected = %Q(<i class=\"fa fa-user\"></i> Login)
      expect(rspec).to eq expected
    end

    it "can get a right icon element with text" do
      rspec = helper.fa_icon 'user', text: 'Login', right: true
      expected = %Q(Login <i class=\"fa fa-user\"></i>)
      expect(rspec).to eq expected
    end

    it "can get a 4x icon element" do
      rspec = helper.fa_icon 'user 4x'
      expected = %Q(<i class=\"fa fa-user fa-4x\"></i>)
      expect(rspec).to eq expected
    end
  end
end
