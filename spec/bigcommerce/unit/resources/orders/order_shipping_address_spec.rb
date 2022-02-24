# frozen_string_literal: true

RSpec.describe Bigcommerce::OrderShippingAddress do
  before(:each) { @shipping_address = Bigcommerce::OrderShippingAddress }

  let(:params) { 1 }

  describe '.count' do
    it 'should hit the correct path' do
      expect(@shipping_address).to receive(:get).with('orders/1/shipping_addresses/count', {})
      @shipping_address.count params
    end
  end

  describe '.count_all' do
    it 'should hit the correct path' do
      expect(@shipping_address).to receive(:get).with('orders/shipping_addresses/count', {})
      @shipping_address.count_all
    end
  end
end
