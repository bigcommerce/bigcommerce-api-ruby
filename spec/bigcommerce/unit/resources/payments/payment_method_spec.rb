require 'spec_helper'

describe Bigcommerce::PaymentMethod do
  before(:each) { @payment_method = Bigcommerce::PaymentMethod }

  let(:params) do
    {
      page: 1
    }
  end

  describe '.all' do
    it 'should hit the correct path without params' do
      expect(@payment_method).to receive(:get).with('payments/methods', {})
      @payment_method.all
    end

    it 'should hit the correct path with params' do
      expect(@payment_method).to receive(:get).with('payments/methods', params)
      @payment_method.all params
    end
  end
end
