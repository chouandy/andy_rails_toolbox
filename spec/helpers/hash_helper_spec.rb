require "rails_helper"

RSpec.describe HashHelper do

  describe "#get_value" do

    it "has defined in HashHelper" do
      options = {}
      expect(helper.get_value :a, options).to be_nil
    end

    context "without give a default value argument" do

      it "can get a value from a hash by a existed key" do
        options = { a: '1' }
        expect(helper.get_value :a, options).to eq('1')
      end

      it "should get nil if key is not existed in a hash" do
        options = { a: '1' }
        expect(helper.get_value :b, options).to be_nil
      end
    end

    context "with a default value argument" do

      it "should get the default value if the value is nil" do
        options = { a: nil }
        expect(helper.get_value :b, options, '1').to eq('1')
      end

      it "should get the default value if key is not existed in a hash" do
        options = { a: '1' }
        expect(helper.get_value :b, options, '2').to eq('2')
      end
    end
  end

  describe "#pop_value" do

    it "has defined in HashHelper" do
      options = {}
      expect(helper.pop_value :a, options).to be_nil
    end

    context "without a default value argument" do

      it "can get a value from a hash by a existed key" do
        options = { 'a' => '1' }
        expect(helper.pop_value :a, options).to eq('1')
      end

      it "should get nil if key is not existed in a hash" do
        options = { a: '1' }
        expect(helper.pop_value :b, options).to be(nil)
      end

      it "the key should be disappear from the hash" do |variable|
        options = { a: '1' }
        helper.pop_value :a, options
        expect(options).to eq({})
      end
    end

    context "with a default value argument" do

      it "should get the default value if the value is nil" do
        options = { a: nil }
        expect(helper.pop_value :b, options, '1').to eq('1')
      end

      it "should get the default value if key is not existed in a hash" do
        options = { a: '1' }
        expect(helper.pop_value :b, options, '2').to eq('2')
      end
    end
  end

  describe "#symbolize_keys" do

    it "has defined in HashHelper" do
      options = {}
      expect(helper.symbolize_keys options).to eq({})
    end

    it "should get a new hash that all keys are symbol " do
      options = { 'a' => '1', 'b' => '2', 'c' => '3' }
      expect(helper.symbolize_keys options).to eq({ a: '1', b: '2', c: '3' })
    end
  end
end
