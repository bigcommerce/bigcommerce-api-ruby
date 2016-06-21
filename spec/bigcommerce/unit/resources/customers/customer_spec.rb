RSpec.describe Bigcommerce::Customer do
  before(:each) { @customer = Bigcommerce::Customer }

  describe '.count' do
    it 'should hit the correct path and should allow params' do
      params = { page: 1 }
      expect(@customer).to receive(:get).with('customers/count', params)
      @customer.count params
    end
  end
end
