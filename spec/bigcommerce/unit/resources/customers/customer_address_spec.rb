require 'spec_helper'

describe Bigcommerce::CustomerAddress do
  before(:each) { @address = Bigcommerce::CustomerAddress }

  let(:params) { 1 }

  describe '.count' do
    it 'should hit the correct path' do
      expect(@address).to receive(:get).with('customers/1/addresses/count')
      @address.count params
    end
  end

  describe '.count_all' do
    it 'should hit the correct path' do
      expect(@address).to receive(:get).with('customers/addresses/count')
      @address.count_all
    end
  end
end
