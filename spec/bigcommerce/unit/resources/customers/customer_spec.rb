RSpec.describe Bigcommerce::Customer do
  before(:each) { @customer = Bigcommerce::Customer }

  describe '.count' do
    it 'should hit the correct path' do
      expect(@customer).to receive(:get).with('customers/count', {})
      @customer.count
    end
  end
end
