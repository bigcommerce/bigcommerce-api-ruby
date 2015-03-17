# Bigcommerce

[![Gem Version](https://badge.fury.io/rb/bigcommerce.png)](https://rubygems.org/gems/bigcommerce)
[![Build Status](https://travis-ci.org/bigcommerce/bigcommerce-api-ruby.png?branch=master)](https://travis-ci.org/bigcommerce/bigcommerce-api-ruby)
[![Dependency Status](https://gemnasium.com/bigcommerce/bigcommerce-api-ruby.png?travis)](https://gemnasium.com/bigcommerce/bigcommerce-api-ruby)
[![Code Climate](https://codeclimate.com/github/bigcommerce/bigcommerce-api-ruby.png)](https://codeclimate.com/github/bigcommerce/bigcommerce-api-ruby)
[![Coverage Status](https://coveralls.io/repos/bigcommerce/bigcommerce-api-ruby/badge.png?branch=master)](https://coveralls.io/r/bigcommerce/bigcommerce-api-ruby?branch=master)

This is the official Bigcommerce API client to support our Rest API. You can find more information about becoming a Bigcommerce developer here: [developer.bigcommerce.com](http://developer.bigcommerce.com).

#### ⚠️ A note about the current client: ⚠️
This is a preview release of the 1.0.0 version of the Bigcommerce API Client. Please report issues if they come up.

We have introduced a new major version of the API client and it is a complete rewrite (for the better). If you want to see the old version of the API client, please view it here: [Bigcommerce API client v0.x](https://github.com/bigcommerce/bigcommerce-api-ruby/tree/0.x). We recommend that developers upgrade to the latest client, but we will still support our developers who are unable to upgrade.


## Installation
Bigcommerce is available on Rubygems:

```sh
gem install bigcommerce --pre
```

You can also add it to your Gemfile.

```rb
gem 'bigcommerce', '>= 1.0.0.beta'
```

## Getting Started
In order to make requests to our API, you must register as a developer and have your credentials ready.

We currently have two different authentication schemes you can use depending on your use-case.

#### Public Apps
Public apps can be submitted to Bigcommerce App Store, allowing other businesses to install it in their Bigcommerce stores.

[More Information](https://developer.bigcommerce.com/api/using-oauth-intro)

#### Private Apps
To develop a custom integration for one store, your app needs to use Basic Authentication.

[More Information](https://developer.bigcommerce.com/api/legacy/basic-auth)

## Usage
For full examples on using the API client, please see the [examples folder](examples).

## Configuration
In order to authenticate the API client, you will need to configure the client like this:

#### Single Click (Public Apps):

- ```client_id```: Obtained from the "My Apps" section on the [developer portal](http://developer.bigcommerce.com).
- ```access_token```: Obtained after a token exchange in the auth callback.
- ```store_hash```: Also obtained after the token exchange.

```rb
Bigcommerce.configure do |config|
  config.store_hash = 'store_hash'
  config.client_id = 'client_id'
  config.access_token = 'access_token'
end
```

#### Private Apps:

To get all the private app credentials, simply visit your store admin page and navigate to the Settings > Legacy API Settings. Once there, you can create a new username to authenticate with.

```rb
Bigcommerce.configure do |config|
  config.auth = 'legacy'
  config.url = 'https://api_path.com'
  config.username = 'username'
  config.api_key = 'api_key'
end
```

__SSL Configuration:__

If you are using your own self-signed certificate, you can pass SSL options to Faraday. This is not required, but may be useful in special edge cases.

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
- [Setting up SSL certificates](https://github.com/lostisland/faraday/wiki/Setting-up-SSL-certificates)

## Contributing
See [CONTRIBUTING.md](CONTRIBUTING.md)
