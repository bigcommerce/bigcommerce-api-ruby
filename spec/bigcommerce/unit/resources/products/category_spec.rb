require 'spec_helper'

describe Bigcommerce::Category do
  before(:each) { @category = Bigcommerce::Category }

  describe '.count' do
    it 'should hit the correct path' do
      expect(@category).to receive(:get).with('categories/count')
      @category.count
    end
  end
end
