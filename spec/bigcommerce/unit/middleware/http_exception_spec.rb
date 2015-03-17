require 'spec_helper'

describe Bigcommerce::Middleware::HttpException do
  before(:each) { @e = Bigcommerce::Middleware::HttpException.new }

  it 'should check for an error on all responses' do
    env = {
      status: '200',
      body: 'Valid'
    }
    expect(@e).to receive(:throw_http_exception!).with(200, env)
    @e.on_complete env
  end

  context 'when valid response' do
    let(:env) do
      {
        status: '200',
        body: 'Valid'
      }
    end

    it 'should return its argument if no errors' do
      expect(@e.on_complete(env)).to eq env
    end
  end

  context 'when invalid response' do
    let(:env) do
      {
        status: '404',
        body: 'Error'
      }
    end

    it 'should throw an exception' do
      expect { @e.on_complete(env) }.to raise_exception
    end
  end
end
