require 'spec_helper'

describe Bigcommerce do
  describe 'VERSION' do
    it "should have a version number set" do
      expect(Bigcommerce::VERSION).to_not be_nil
    end

    it "should use a semantic version format" do
      expect(Bigcommerce::VERSION).to match(/\d+\.\d+\.\d+(rc\d?)?/)
    end
  end
end
