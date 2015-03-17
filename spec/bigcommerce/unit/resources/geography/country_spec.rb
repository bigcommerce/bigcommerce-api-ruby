require 'spec_helper'

describe Bigcommerce::Country do
  before(:each) { @country = Bigcommerce::Country }

  describe '.count' do
    it 'should hit the correct path' do
      expect(@country).to receive(:get).with('countries/count')
      @country.count
    end
  end
end
