require 'spec_helper'

describe Bigcommerce::GoogleProductSearchMapping do
  before(:each) { @mapping = Bigcommerce::GoogleProductSearchMapping }

  let(:params) { 1 }

  describe '.all' do
    it 'should hit the correct path' do
      expect(@mapping).to receive(:get).with('products/1/googleproductsearch')
      @mapping.all params
    end
  end
end
