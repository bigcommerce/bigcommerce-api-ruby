RSpec.describe Bigcommerce::CustomerGroup do
  before(:each) { @group = Bigcommerce::CustomerGroup }

  describe '.count' do
    it 'should hit the correct path' do
      expect(@group).to receive(:get).with('customer_groups/count')
      @group.count
    end
  end
end
