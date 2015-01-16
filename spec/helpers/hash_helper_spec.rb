require './app/helpers/hash_helper'

RSpec.configure do |c|
  c.include HashHelper
end

RSpec.describe "HashHelper" do

  context "#get_value" do

    it "has defined in HashHelper" do
      options = {}
      expect(get_value :a, options).to be(nil)
    end

    context "don't give a default value argument" do

      it "can get a value from a hash by a existed key" do
        options = { a: '1' }
        expect(get_value :a, options).to eq('1')
      end

      it "should get nil if key is not existed in a hash" do
        options = { a: '1' }
        expect(get_value :b, options).to be(nil)
      end
    end

    context "give a default value argument" do

      it "should get the default value if the value is nil" do
        options = { a: nil }
        expect(get_value :b, options, '1').to eq('1')
      end

      it "should get the default value if key is not existed in a hash" do
        options = { a: '1' }
        expect(get_value :b, options, '2').to eq('2')
      end
    end
  end

  context "#pop_value" do

    it "has defined in HashHelper" do
      options = {}
      expect(pop_value :a, options).to be(nil)
    end

    context "don't give a default value argument" do

      it "can get a value from a hash by a existed key" do
        options = { 'a' => '1' }
        expect(pop_value :a, options).to eq('1')
      end

      it "should get nil if key is not existed in a hash" do
        options = { a: '1' }
        expect(pop_value :b, options).to be(nil)
      end

      it "should be disappear by using pop_value pop the key from a hash" do |variable|
        options = { a: '1' }
        pop_value :a, options
        expect(options).to eq({})
      end
    end

    context "give a default value argument" do

      it "should get the default value if the value is nil" do
        options = { a: nil }
        expect(pop_value :b, options, '1').to eq('1')
      end

      it "should get the default value if key is not existed in a hash" do
        options = { a: '1' }
        expect(pop_value :b, options, '2').to eq('2')
      end
    end
  end

  context "#symbolize_keys" do

    it "has defined in HashHelper" do
      options = {}
      expect(symbolize_keys options).to eq({})
    end

    it "should get a new hash that all keys are symbol " do
      options = { 'a' => '1', 'b' => '2', 'c' => '3' }
      expect(symbolize_keys options).to eq({ a: '1', b: '2', c: '3' })
    end
  end
end
