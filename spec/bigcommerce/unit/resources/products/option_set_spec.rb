require 'spec_helper'

describe Bigcommerce::OptionSet do
  before(:each) { @option_set = Bigcommerce::OptionSet }

  describe '.count' do
    it 'should hit the correct path' do
      expect(@option_set).to receive(:get).with('option_sets/count')
      @option_set.count
    end
  end
end
