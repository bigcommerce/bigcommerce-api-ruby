# frozen_string_literal: true

RSpec.describe Bigcommerce::ProductReview do
  before(:each) { @product_review = Bigcommerce::ProductReview }

  let(:params) { 1 }

  describe '.all' do
    it 'should hit the correct path' do
      expect(@product_review).to receive(:get).with('products/1/reviews', {})
      @product_review.all params
    end
  end
end
