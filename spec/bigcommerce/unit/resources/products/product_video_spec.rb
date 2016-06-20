RSpec.describe Bigcommerce::ProductVideo do
  before(:each) { @video = Bigcommerce::ProductVideo }

  let(:params) { 1 }

  describe '.count' do
    it '.count should hit the correct path' do
      expect(@video).to receive(:get).with('products/1/videos/count')
      @video.count params
    end
  end

  describe '.count_all' do
    it '.count should hit the correct path' do
      expect(@video).to receive(:get).with('products/videos/count')
      @video.count_all
    end
  end
end
