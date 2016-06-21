RSpec.describe Bigcommerce::BlogPost do
  before(:each) { @blog_post = Bigcommerce::BlogPost }

  describe '.count' do
    it 'should hit the correct path' do
      expect(@blog_post).to receive(:get).with('blog/posts/count', {})
      @blog_post.count
    end
  end
end
