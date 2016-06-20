RSpec.describe Bigcommerce::OrderProduct do
  before(:each) { @order_product = Bigcommerce::OrderProduct }
  
  let(:params) { 1 }

  describe '.count' do
    it 'should hit the correct path' do
      expect(@order_product).to receive(:get).with('orders/1/products/count')
      @order_product.count params
    end
  end

  describe '.count_all' do
    it 'should hit the correct path' do
      expect(@order_product).to receive(:get).with('orders/products/count')
      @order_product.count_all
    end
  end
end
