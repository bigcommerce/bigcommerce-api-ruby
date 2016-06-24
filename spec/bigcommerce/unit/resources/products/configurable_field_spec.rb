RSpec.describe Bigcommerce::ConfigurableField do
  before(:each) { @configurable_field = Bigcommerce::ConfigurableField }

  let(:params) { 1 }

  describe '.count' do
    it 'should hit the correct path' do
      expect(@configurable_field).to receive(:get).with('products/1/configurable_fields/count', {})
      @configurable_field.count params
    end
  end

  describe '.count_all' do
    it 'should hit the correct path' do
      expect(@configurable_field).to receive(:get).with('products/configurable_fields/count', {})
      @configurable_field.count_all
    end
  end
end
