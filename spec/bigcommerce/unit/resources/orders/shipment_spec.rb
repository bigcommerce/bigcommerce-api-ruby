# frozen_string_literal: true

RSpec.describe Bigcommerce::Shipment do
  before(:each) { @shipment = Bigcommerce::Shipment }

  let(:params) { 1 }

  describe '.count' do
    it 'hit the correct path' do
      expect(@shipment).to receive(:get).with('orders/1/shipments/count', {})
      @shipment.count params
    end
  end

  describe '.count_all' do
    it 'hit the correct path' do
      expect(@shipment).to receive(:get).with('orders/shipments/count', {})
      @shipment.count_all
    end
  end
end
