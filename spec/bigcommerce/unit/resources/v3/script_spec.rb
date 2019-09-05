RSpec.describe Bigcommerce::V3::Script do
  before(:each) { @script = Bigcommerce::V3::Script }

  describe '.all' do
    it 'should hit the correct path' do
      expect(@script).to receive(:get).with(@script.path.build, {})
      @script.all
    end
  end
end
