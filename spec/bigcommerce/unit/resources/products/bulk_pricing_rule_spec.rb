require 'spec_helper'

describe Bigcommerce::BulkPricingRule do
  before(:each) { @bulk_pricing_rule = Bigcommerce::BulkPricingRule }

  let(:params) { 1 }

  describe '.count' do
    it 'should hit the correct path' do
      expect(@bulk_pricing_rule).to receive(:get).with('products/1/discount_rules/count')
      @bulk_pricing_rule.count params
    end
  end

  describe '.count_all' do
    it 'should hit the correct path' do
      expect(@bulk_pricing_rule).to receive(:get).with('products/discount_rules/count')
      @bulk_pricing_rule.count_all
    end
  end
end
