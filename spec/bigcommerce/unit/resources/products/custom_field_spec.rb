RSpec.describe Bigcommerce::CustomField do
  before(:each) { @custom_field = Bigcommerce::CustomField }

  let(:params) { 1 }

  describe '.count' do
    it 'should hit the correct path' do
      expect(@custom_field).to receive(:get).with('products/1/custom_fields/count', {})
      @custom_field.count params
    end
  end

  describe '.count_all' do
    it 'should hit the correct path' do
      expect(@custom_field).to receive(:get).with('products/custom_fields/count', {})
      @custom_field.count_all
    end
  end
end
