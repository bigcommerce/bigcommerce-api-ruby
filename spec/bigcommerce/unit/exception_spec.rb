require 'spec_helper'

describe Bigcommerce::HttpErrors do
  let(:dummy_class) { Class.new { extend Bigcommerce::HttpErrors } }

  it '::ERRORS is not nil' do
    expect(Bigcommerce::HttpErrors::ERRORS).not_to be_nil
  end

  context 'invalid response status' do
    it 'should throw an exception' do
      code = 404
      expect { dummy_class.throw_http_exception!(code) }.to raise_exception
    end

    it 'should have a valid error' do
      codes = Bigcommerce::HttpErrors::ERRORS.keys
      codes.each do |code|
        expect { dummy_class.throw_http_exception!(code) }.to raise_exception
      end
    end

    it 'should allow you to pass in an error message when throwing exception' do
      code = 404
      env = double
      allow(env).to receive(:body) { {} }
      allow(env).to receive(:[]) { {} }
      expect do
        dummy_class.throw_http_exception!(code, env)
      end.to raise_exception(Bigcommerce::HttpErrors::ERRORS[code])
    end

    it 'should parse out a retry-after header if present' do
      code = 429
      env = double
      allow(env).to receive(:body) { "{\"time\":1426184190}" }
      allow(env).to receive(:[]).with(:response_headers).and_return('X-Retry-After' => 1)
      begin
        dummy_class.throw_http_exception!(code, env)
      rescue Bigcommerce::TooManyRequests => e
        expect(e.response_headers[:retry_after]).to eq 1
      end
    end

    it 'handle string in body' do
      message = 'Unauthorized'
      code = 401
      env = double(:env)
      allow(env).to receive(:body) { message }
      allow(env).to receive(:[]) { {} }
      begin
        dummy_class.throw_http_exception!(code, env)
      rescue Bigcommerce::Unauthorized => e
        expect(e.message).to eq message
      end
    end
  end

  context 'valid response status' do
    it 'should not throw an exception' do
      code = 200
      env = double
      expect { dummy_class.throw_http_exception!(code, env) }.to_not raise_exception
    end
  end
end
