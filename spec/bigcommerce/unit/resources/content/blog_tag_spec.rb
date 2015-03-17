require 'spec_helper'

describe Bigcommerce::BlogTag do
  before(:each) { @blog_tag = Bigcommerce::BlogTag }

  describe '.all' do
    it 'should hit the correct path' do
      expect(@blog_tag).to receive(:get).with(@blog_tag.path.build)
      @blog_tag.all
    end
  end
end
