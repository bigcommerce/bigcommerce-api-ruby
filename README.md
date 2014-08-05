Bigcommerce API V2 - Ruby Client
================================

[![Gem Version](https://badge.fury.io/rb/bigcommerce.png)](https://rubygems.org/gems/bigcommerce)
[![Build Status](https://travis-ci.org/bigcommerce/bigcommerce-api-ruby.png?branch=master)](https://travis-ci.org/bigcommerce/bigcommerce-api-ruby)
[![Dependency Status](https://gemnasium.com/bigcommerce/bigcommerce-api-ruby.png?travis)](https://gemnasium.com/bigcommerce/bigcommerce-api-ruby)
[![Code Climate](https://codeclimate.com/github/bigcommerce/bigcommerce-api-ruby.png)](https://codeclimate.com/github/bigcommerce/bigcommerce-api-ruby)
[![Coverage Status](https://coveralls.io/repos/bigcommerce/bigcommerce-api-ruby/badge.png?branch=master)](https://coveralls.io/r/bigcommerce/bigcommerce-api-ruby?branch=master)

This library provides a wrapper around the Bigcommerce REST API for use within
Ruby apps or via the console.

Note
----
If you find anything that is missing or needs clean up, please feel free to fork
it and submit a changes with your pull request.

Requirements
------------

- Ruby 1.9+

To connect to the API, you need the following credentials:

- Secure URL pointing to a Bigcommerce store
- Username of an authorized admin user of the store
- API key for the user

A valid API key is required to authenticate requests. To grant API access for a
user, go to Control Panel > Users > Edit User and make sure that the
'Enable API access?' checkbox is ticked.

Installation
------------

Download the lib folder and copy it to a path accessible within your app, or
install the package directly from Rubygems:

```
gem install bigcommerce
```

Note that the RubyGems version of this gem might be outdated. You can install the
gem directly from this repo. If you are using Rails, you can point your Gemfile
to this git repo directly or do a local install of the gem by -

```
rake build
gem install pkg/bigcommerce-*.gem
```

Configuration
-------------

To use the API client in your Ruby code, provide the required credentials as
follows:

```
require 'bigcommerce'

api = Bigcommerce::Api.new({
	:store_url => "https://store.mybigcommerce.com",
	:username  => "admin",
	:api_key   => "d81aada4c19c34d913e18f07fd7f36ca"
})
```

If you want to enable SSL certificates -

```
require 'bigcommerce'
api = Bigcommerce::Api.new({
	:store_url => "https://store.mybigcommerce.com",
	:username  => "admin",
	:api_key   => "d81aada4c19c34d913e18f07fd7f36ca"
	:ssl_client_cert  =>  OpenSSL::X509::Certificate.new(File.read("cert.pem")),
  	:ssl_client_key   =>  OpenSSL::PKey::RSA.new(File.read("key.pem"), "passphrase, if any"),
  	:ssl_ca_file      =>  "ca_certificate.pem",
  	:verify_ssl       =>  OpenSSL::SSL::VERIFY_PEER
})
```
Remember that the fields `:ssl_client_cert`, `:ssl_client_key`, `:ssl_ca_file`
and `:verify_ssl` are all required when enabling SSL certificates.

Connecting to the store
-----------------------

Ping the time method to check that your configuration is working and you
can connect successfully to the store:

```
ping = api.get_time
```

Usage
-----

The API object acts as a gateway to all top level resources in the V2 API.

Fetch Data
```
orders = api.get_orders
orders = api.get_orders({:min_id=>100,:max_id=>101})
orders = api.get_orders(:is_deleted => true)

products = api.get_products
products = api.get_products(:description=>"iphone", :condition=>"New")

options = api.get_options
options = api.get_options(:type=>"MT")
...

```
Create Data
```
api.create_products({:name => "Spiderman - The best return",:price => 9.99,:categories => [17],:type =>"physical",:availability => "available", :weight => 1})

api.update_products(31,{:name => "marvel comics spiderman",:sku => "marvel-spidey-1", :inventory_tracking => "simple", :inventory_level => 500})

api.update_orders(101,{:status_id => 12, :is_deleted => true})

```
Update Data

```
api.update_products(31,{:name => "marvel comics spiderman",:sku => "marvel-spidey-1", :inventory_tracking => "simple", :inventory_level => 500})

api.update_optionsets(13,{:name => "Marvel toys"})

```
