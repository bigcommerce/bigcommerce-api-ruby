RSpec.describe Bigcommerce::Sku do
  before(:each) { @sku = Bigcommerce::Sku }

  let(:params) { 1 }

  describe '.count' do
    it 'should hit the correct path' do
      expect(@sku).to receive(:get).with('products/1/skus/count')
      @sku.count params
    end
  end

  describe '.count_all' do
    it 'should hit the correct path' do
      expect(@sku).to receive(:get).with('products/skus/count')
      @sku.count_all
    end
  end
end
