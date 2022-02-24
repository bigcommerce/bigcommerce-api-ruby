# frozen_string_literal: true

require 'securerandom'

RSpec.describe Bigcommerce::Middleware::Auth do
  let(:api) { Bigcommerce::Middleware::Auth.new(app, options) }
  let(:app) { double(:app) }
  let(:client_id) { SecureRandom.uuid }
  let(:client_token) { SecureRandom.uuid }
  let(:options) do
    {
      client_id: client_id,
      access_token: client_token
    }
  end

  describe '#call' do
    subject { api.call(request_headers: {}) }

    it 'sets the correct headers' do
      expected_hash = {
        request_headers: {
          'X-Auth-Client' => client_id,
          'X-Auth-Token' => client_token
        }
      }
      expect(app).to receive(:call).with(expected_hash)
      subject
    end
  end
end
