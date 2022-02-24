# frozen_string_literal: true

RSpec.describe Bigcommerce::Order do
  before(:each) { @order = Bigcommerce::Order }

  describe '.count' do
    it 'should hit the correct path and should allow params' do
      params = { page: 1 }
      expect(@order).to receive(:get).with('orders/count', params)
      @order.count params
    end
  end
end
