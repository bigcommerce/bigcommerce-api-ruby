# Bigcommerce API V2 - Ruby Client

[![Gem Version](https://badge.fury.io/rb/bigcommerce.png)](https://rubygems.org/gems/bigcommerce)
[![Build Status](https://travis-ci.org/bigcommerce/bigcommerce-api-ruby.png?branch=master)](https://travis-ci.org/bigcommerce/bigcommerce-api-ruby)
[![Dependency Status](https://gemnasium.com/bigcommerce/bigcommerce-api-ruby.png?travis)](https://gemnasium.com/bigcommerce/bigcommerce-api-ruby)
[![Code Climate](https://codeclimate.com/github/bigcommerce/bigcommerce-api-ruby.png)](https://codeclimate.com/github/bigcommerce/bigcommerce-api-ruby)
[![Coverage Status](https://coveralls.io/repos/bigcommerce/bigcommerce-api-ruby/badge.png?branch=master)](https://coveralls.io/r/bigcommerce/bigcommerce-api-ruby?branch=master)

This library provides a wrapper around the Bigcommerce REST API for use within
Ruby apps or via the console.

### Note

If you find anything that is missing or needs clean up, please feel free to fork
it and submit a changes with your pull request.

## Requirements

- Ruby 1.9+

To connect to the API, you need the following credentials:

For the OAuth API:

- Create and register an app at [developer.bigcommerce.com](https://developer.bigcommerce.com).
- Have a callback URL defined
- Prepare the `client_id` credential

For the Legacy API:

- Secure URL pointing to a Bigcommerce store
- Username of an authorized admin user of the store
- API key for the user

A valid API key is required to authenticate requests. To grant API access for a user, go to Control Panel > Users > Edit User and make sure that the 'Enable API access?' checkbox is ticked.

## Installation

Download the lib folder and copy it to a path accessible within your app, or
install the package directly from Rubygems:

```sh
gem install bigcommerce
```

## Configuration

#### OAuth Authentication

In order to create a new Bigcommerce application, please visit [developer.bigcommerce.com](https://developer.bigcommerce.com). Its free to sign up and only takes a moment. Once you have created your app, you can get a `client_id`.

To use the API client in your Ruby code, provide the required credentials as
follows:

```rb
require 'bigcommerce'

api = Bigcommerce::Api.new({
  :store_hash    => 'STORE_HASH',
  :client_id     => 'CLIENT_ID',
  :access_token  => 'ACCESS_TOKEN'
})
```

__NOTE:__ You do not need extra SSL certificates when connecting to the OAuth version of the api.

#### Legacy Credentials

To use the API client with the legacy credentials you can visit the main store page and under the "Setup & Tools" dropdown, you will see a link for the legacy API credentials.

```rb
require 'bigcommerce'

api = Bigcommerce::Api.new({
  :store_url => "https://store.mybigcommerce.com",
  :username  => "username",
  :api_key   => "api_key"
})
```

You can also enable SSL for the Legacy API.

```rb
require 'bigcommerce'

api = Bigcommerce::Api.new({
  :store_url => "https://store.mybigcommerce.com",
  :username  => "username",
  :api_key   => "api_key",
  :ssl_client_cert  =>  OpenSSL::X509::Certificate.new(File.read("cert.pem")),
  :ssl_client_key   =>  OpenSSL::PKey::RSA.new(File.read("key.pem"), "passphrase, if any"),
  :ssl_ca_file      =>  "ca_certificate.pem",
  :verify_ssl       =>  OpenSSL::SSL::VERIFY_PEER
})
```
Remember that the fields `:ssl_client_cert`, `:ssl_client_key`, `:ssl_ca_file`
and `:verify_ssl` are all required when enabling SSL certificates.

## Connecting to the store

Once you have authenticated with the OAuth or Legacy credentials, ping the time method to check that your configuration is working and you can connect successfully to the store:

```rb
ping = api.time()
```

## Reference

For full reference about the resources and supported endpoints, please see [developer.bigcommerce.com](https://developer.bigcommerce.com).