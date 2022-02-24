# frozen_string_literal: true

RSpec.describe Bigcommerce::System do
  before(:each) { @system = Bigcommerce::System }

  describe '.time' do
    it 'should hit the correct path' do
      expect(@system).to receive(:get).with(@system.path.build, {})
      @system.time
    end
  end
end
