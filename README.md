Bigcommerce API V2 - Ruby Client
================================

This library provides a wrapper around the Bigcommerce REST API for use within
Ruby apps or via the console.

Note
----
If you find anything that is missing or needs clean up, please feel free to fork it and submit a changes with your pull request.

Requirements
------------

- Ruby 1.9+

To connect to the API, you need the following credentials:

- Secure URL pointing to a Bigcommerce store
- Username of an authorized admin user of the store
- API key for the user

A valid API key is required to authenticate requests. To grant API access for
user, go to Control Panel > Users > Edit User and make sure that the
'Enable API access?' checkbox is ticked.

Installation
------------

Download the lib folder and copy it to a path accessible within your app, or
install the package directly from Rubygems:

```
gem install bigcommerce
```

Note - the current gem version is 1.0. The Rubygems version might be older. You can install the gem directly from this repo. If you are using rails, you can point your gemfile to this git repo directly or do a local install of the gem by -

```
gem build bigcommerce
gem install bigcommerce-1.0.gem
```

Configuration
-------------

To use the API client in your Ruby code, provide the required credentials as
follows:

```
require 'bigcommerce'

api = BigCommerce::Api.new({
	:store_url => "https://store.mybigcommerce.com",
	:username  => "admin",
	:api_key   => "d81aada4c19c34d913e18f07fd7f36ca"
})
```

If you want to enable SSL certificates -

```
require 'bigcommerce'
api = BigCommerce::Api.new({
	:store_url => "https://store.mybigcommerce.com",
	:username  => "admin",
	:api_key   => "d81aada4c19c34d913e18f07fd7f36ca"
	:ssl_client_cert  =>  OpenSSL::X509::Certificate.new(File.read("cert.pem")),
  	:ssl_client_key   =>  OpenSSL::PKey::RSA.new(File.read("key.pem"), "passphrase, if any"),
  	:ssl_ca_file      =>  "ca_certificate.pem",
  	:verify_ssl       =>  OpenSSL::SSL::VERIFY_PEER 
})
```
Remember that the fields :ssl_client_cert, :ssl_client_key, :ssl_ca_file and :verify_ssl are all requrired when enabling SSL certs.

Connecting to the store
-----------------------

Ping the get_time method to check that your configuration is working and you
can connect successfully to the store:

```
ping = api.get_time
```

Usage
-----

The API object acts as a gateway to all top level resources in the V2 API.

```
$ irb
>
> api = BigCommerce::Api.new(...)
>
> api.get_products.each { |product| puts product.name }
>
> api.get_customers.each { |customer| puts customer.email }
>
> puts api.get_orders_count
>
> category = api.get_category(11)
> category.name = "Laptops"
> category.update
>
> brand = BigCommerce::Api::Brand.new
> brand.name = "Samsung"
> brand.create
>
> option = api.get_option(22)
> option.delete
>
```

