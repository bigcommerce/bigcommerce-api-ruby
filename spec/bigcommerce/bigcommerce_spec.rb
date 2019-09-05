RSpec.describe Bigcommerce do
  let(:middleware) do
    api.instance_variable_get('@builder').instance_variable_get('@handlers')
  end

  describe 'version configuration' do
    context 'default version' do
      it 'should return the api_url with default version 2' do
        Bigcommerce.configure do |config|
          config.access_token = 'jksdgkjbhksjdb'
          config.client_id = 'negskjgdjkbg'
          config.store_hash = 'some_store'
        end
        expect(Bigcommerce.config.api_url).to include('/v2')
      end
    end

    context 'custom version' do
      it 'should return the api_url with custom version' do
        Bigcommerce.configure do |config|
          config.access_token = 'jksdgkjbhksjdb'
          config.client_id = 'negskjgdjkbg'
          config.store_hash = 'some_store'
          config.version = '3'
        end
        expect(Bigcommerce.config.api_url).to include('/v3')
      end
    end
  end

  it 'should return a faraday object when configured' do
    Bigcommerce.configure do |config|
      config.url = 'http://foobar.com'
      config.auth = 'legacy'
      config.api_key = '214789175'
      config.username = 'admin'
    end
    expect(Bigcommerce.api).to be_a_kind_of(Faraday::Connection)
  end

  describe '.build_connection' do
    context 'when using legacy' do
      let(:api) do
        Bigcommerce.configure do |config|
          config.url = 'http://foobar.com'
          config.auth = 'legacy'
          config.api_key = '214789175'
          config.username = 'admin'
        end
      end

      it 'should have the correct auth middleware' do
        expect(middleware).to include(Faraday::Request::BasicAuthentication)
      end
    end

    context 'when not using legacy' do
      let(:api) do
        Bigcommerce.configure do |config|
          config.access_token = 'jksdgkjbhksjdb'
          config.client_id = 'negskjgdjkbg'
        end
      end

      it 'should have the correct auth middleware' do
        expect(middleware).to include(Bigcommerce::Middleware::Auth)
      end
    end
  end

  describe 'multiple configurations' do
    it 'should use the configuration for the most recently defined' do
      Bigcommerce.configure do |config|
        config.access_token = 'jksdgkjbhksjdb'
        config.client_id = 'negskjgdjkbg'
      end

      Bigcommerce.configure do |config|
        config.url = 'http://foobar.com'
        config.auth = 'legacy'
        config.api_key = '214789175'
        config.username = 'admin'
      end

      expect(Bigcommerce.api.instance_variable_get('@builder')
                .instance_variable_get('@handlers'))
                .to include(Faraday::Request::BasicAuthentication)

      Bigcommerce.configure do |config|
        config.access_token = 'jksdgkjbhksjdb'
        config.client_id = 'negskjgdjkbg'
      end

      expect(Bigcommerce.api.instance_variable_get('@builder')
                .instance_variable_get('@handlers'))
                .to include(Bigcommerce::Middleware::Auth)
    end
  end
end
