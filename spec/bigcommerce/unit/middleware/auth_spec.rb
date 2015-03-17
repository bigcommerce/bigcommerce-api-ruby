require 'spec_helper'

describe Bigcommerce::Middleware::Auth do
  it 'should set the correct headers' do
    app = double
    options = {
      client_id: 'client_id',
      access_token: 'access_token'
    }
    @api = Bigcommerce::Middleware::Auth.new(app, options)
    expect(app).to receive(:call).with(
      request_headers: {
        'X-Auth-Client' => 'client_id',
        'X-Auth-Token' => 'access_token'
      })
    @api.call(request_headers: {})
  end
end
