RSpec.describe Bigcommerce::State do
  before(:each) { @state = Bigcommerce::State }

  let(:params) { 226 }

  describe '.count' do
    it 'should hit the correct path' do
      expect(@state).to receive(:get).with('countries/226/states/count', {})
      @state.count params
    end
  end

  describe '.count_all' do
    it 'should hit the correct path' do
      expect(@state).to receive(:get).with('countries/states/count', {})
      @state.count_all
    end
  end
end
