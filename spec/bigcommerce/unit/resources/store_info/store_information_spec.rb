RSpec.describe Bigcommerce::StoreInfo do
  before(:each) { @store_info = Bigcommerce::StoreInfo }

  describe '.info' do
    it 'should hit the correct path' do
      expect(@store_info).to receive(:get).with(@store_info.path.build, {})
      @store_info.info
    end
  end
end
