RSpec.describe Bigcommerce::ProductRule do
  before(:each) { @rule = Bigcommerce::ProductRule }

  let(:params) { 1 }

  describe '.count' do
    it 'should hit the correct path' do
      expect(@rule).to receive(:get).with('products/1/rules/count', {})
      @rule.count params
    end
  end

  describe '.count_all' do
    it 'should hit the correct path' do
      expect(@rule).to receive(:get).with('products/rules/count', {})
      @rule.count_all
    end
  end
end
