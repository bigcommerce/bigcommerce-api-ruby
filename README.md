# BigCommerce API Ruby

[![Gem Version](https://badge.fury.io/rb/bigcommerce.svg)](https://rubygems.org/gems/bigcommerce)
[![Build Status](https://travis-ci.org/bigcommerce/bigcommerce-api-ruby.svg?branch=master)](https://travis-ci.org/bigcommerce/bigcommerce-api-ruby)
[![Dependency Status](https://gemnasium.com/bigcommerce/bigcommerce-api-ruby.svg?travis)](https://gemnasium.com/bigcommerce/bigcommerce-api-ruby)

This is the official BigCommerce API client to support our Stores API. You can find more information about becoming a BigCommerce developer here: [developer.bigcommerce.com](http://developer.bigcommerce.com).


## Installation
BigCommerce is available on [RubyGems](https://rubygems.org/gems/bigcommerce).

```sh
gem install bigcommerce
```

You can also add it to your Gemfile.

```rb
gem 'bigcommerce', '~> 1.0'
```

## Requirements
- Ruby 2.0.0 or newer. Please refer to the `.travis.yml` to see which versions we officially support.

## Getting Started
To make requests to our API, you must register as a developer and have your credentials ready.

Also very important: For the OAuth authentication mechanism, the resources to which you have acccess depend on the scopes that the merchant has granted to your application. For more information about Store API scopes, see: [OAuth Scopes](https://developer.bigcommerce.com/api/scopes).

## Authentication
We currently have two different authentication schemes that you can select, depending on your use case.

### OAuth
OAuth apps can be submitted to [BigCommerce App Store](https://www.bigcommerce.com/apps), allowing other merchants to install these apps in their BigCommerce stores.

__[More Information](https://developer.bigcommerce.com/api/using-oauth-intro)__

### Basic Authentication (Legacy)
To develop a custom integration for one store, your app needs to use Basic Authentication.

__[More Information](https://developer.bigcommerce.com/api/legacy/basic-auth)__

## Configuration
To authenticate your API client, you will need to configure the client like the following examples.

### OAuth App

- ```client_id```: Obtained from the on the BigCommerce [Developer Portal's](http://developer.bigcommerce.com) "My Apps" section.
- ```access_token```: Obtained after a token exchange in the auth callback.
- ```store_hash```: Also obtained after the token exchange.

```rb
Bigcommerce.configure do |config|
  config.store_hash = ENV['BC_STORE_HASH']
  config.client_id = ENV['BC_CLIENT_ID']
  config.access_token = ENV['BC_ACCESS_TOKEN']
end
```

### Basic Authentication (Legacy)

To get all the basic auth credentials, simply visit your store admin page, and navigate to the `Advanced Settings` > `Legacy API Settings`. Once there, you can create a new legacy API account on which to authenticate.

```rb
Bigcommerce.configure do |config|
  config.auth = 'legacy'
  config.url = ENV['BC_API_ENDPOINT_LEGACY']
  config.username = ENV['BC_USERNAME']
  config.api_key = ENV['BC_API_KEY']
end
```

__SSL Configuration__

If you are using your own, self-signed, certificate, you can pass SSL options to Faraday. This is not required, but might be useful in special edge cases.

```rb
Bigcommerce.configure do |config|
  config.auth = 'legacy'
  config.url = 'https://api_path.com'
  config.username = 'username'
  config.api_key = 'api_key'
  config.ssl = {
    # Faraday options here
  }
end
```

For more information about configuring SSL with Faraday, please see the following:

- [Faraday SSL example](https://gist.github.com/mislav/938183)
- [Faraday: Setting up SSL certificates](https://github.com/lostisland/faraday/wiki/Setting-up-SSL-certificates)

### Customer Login API
If you want to generate tokens for storefront login using the Customer Login API, you need to configure your app's client secret.

- ```store_hash```: The store hash of the store you are operating against.
- ```client_id```: Obtained from the on the BigCommerce [Developer Portal's](http://developer.bigcommerce.com) "My Apps" section.
- ```client_secret```: Obtained from the on the BigCommerce [Developer Portal's](http://developer.bigcommerce.com) "My Apps" section.

```rb
Bigcommerce.configure do |config|
  config.store_hash = ENV['BC_STORE_HASH']
  config.client_id = ENV['BC_CLIENT_ID']
  config.client_secret = ENV['BC_CLIENT_SECRET']
end
```

## Usage
For full examples of using the API client, please see the [examples folder](examples) and refer to BigCommerce's [developer documentation](https://developer.bigcommerce.com/api).

Example:

```rb
# Configure the client to talk to a given store
Bigcommerce.configure do |config|
  config.store_hash = ENV['BC_STORE_HASH']
  config.client_id = ENV['BC_CLIENT_ID']
  config.access_token = ENV['BC_ACCESS_TOKEN']
end

# Make an API request for a given resource
Bigcommerce::System.time
=> #<Bigcommerce::System time=1466801314>
```

### Thread Safety

The `Bigcommerce.configure` method is NOT thread-safe. This mechanism is designed for applications or CLI's (command-line interfaces) where thread safety is not a concern. If you need to guarantee thread safety, we support this alternative mechanism to make thread-safe API requests:

Rather then setting up a single `connection` for all API requests, you would construct a new connection for each thread. If you can ensure that each of these connections is stored in a thread-safe manner, you can pass the `connection` as you query the resource.

This connection is nothing more than a `Faraday::Connection` – so if you want to write your own, or to use your own adapters, you can feel free. Please refer to this gem's [connection class](https://github.com/bigcommerce/bigcommerce-api-ruby/blob/master/lib/bigcommerce/connection.rb) for more details.

##### OAuth

```rb
connection = Bigcommerce::Connection.build(
  Bigcommerce::Config.new(
    store_hash: ENV['BC_STORE_HASH'],
    client_id: ENV['BC_CLIENT_ID'],
    access_token: ENV['BC_ACCESS_TOKEN']
  )
)
=> #<Faraday::Connection:0x007fbf95068978 ... >>

Bigcommerce::System.time(connection: connection)
=> #<Bigcommerce::System time=1466546702>

Bigcommerce::System.raw_request(:get, 'time', connection: connection)
=> #<Faraday::Response:0x007fd4a4063170 ... >>
```

##### Basic Auth

```rb
connection_legacy = Bigcommerce::Connection.build(
  Bigcommerce::Config.new(
    auth: 'legacy',
    url: ENV['BC_API_ENDPOINT_LEGACY'],
    username: ENV['BC_USERNAME'],
    api_key: ENV['BC_API_KEY']
  )
)
=> #<Faraday::Connection:0x007fbf95068978 ... >>

Bigcommerce::System.time(connection: connection_legacy)
=> #<Bigcommerce::System time=1466546702>

Bigcommerce::System.raw_request(:get, 'time', connection: connection_legacy)
=> #<Faraday::Response:0x007fd4a4063170 ... >>
```

## Contributing
See [CONTRIBUTING.md](CONTRIBUTING.md)
