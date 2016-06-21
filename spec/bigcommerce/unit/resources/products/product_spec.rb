RSpec.describe Bigcommerce::Product do
  before(:each) { @product = Bigcommerce::Product }

  describe '.count' do
    it 'should hit the correct path with params' do
      params = { page: 1 }
      expect(@product).to receive(:get).with('products/count', params)
      @product.count params
    end
  end
end
