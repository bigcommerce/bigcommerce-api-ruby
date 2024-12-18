# frozen_string_literal: true

RSpec.describe Bigcommerce::Customer do
  describe '.count' do
    it 'should hit the correct path' do
      expect(described_class).to receive(:get).with('customers/count', {})
      described_class.count
    end
  end

  describe '.login_token' do
    let(:client_id) { SecureRandom.hex(6) }
    let(:client_secret) { SecureRandom.hex(6) }
    let(:store_hash) { SecureRandom.hex(4) }
    let(:customer_id) { Random.rand(1000) }
    let(:customer) { described_class.new(id: customer_id) }
    subject { customer.login_token }

    before do
      Bigcommerce.configure do |config|
        config.store_hash = store_hash
        config.client_id = client_id
        config.client_secret = client_secret
      end
    end

    it 'should generate a signed token with the right payload' do
      payload = JWT.decode(subject, client_secret, true, { :algorithm => 'HS256' })[0]
      expect(payload['iss']).to eq(client_id)
      expect(payload['store_hash']).to eq(store_hash)
      expect(payload['operation']).to eq('customer_login')
      expect(payload['customer_id']).to eq(customer_id)
      expect(payload['iat']).to be <= Time.now.to_i
      expect(payload['jti']).to_not be_empty
    end
    context 'optional keys are included with the JWT is present' do
      let(:channel_id) { String(Random.rand(1000)) }
      let(:request_ip) { '127.0.0.1' }

      subject { customer.login_token(optional_claims: { 'channel_id' => channel_id, 'request_ip' => request_ip, 'bogus' => 'claim' }) }

      it 'encodes the JWT with optional claims' do
        payload = JWT.decode(subject, client_secret, true, { :algorithm => 'HS256' })[0]
        expect(payload['channel_id']).to eq(channel_id)
        expect(payload['request_ip']).to eq(request_ip)
        expect(payload['bogus']).to be_nil
      end
    end
  end
end
