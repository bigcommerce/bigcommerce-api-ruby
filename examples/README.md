# Examples
In this directory you can find examples which you may find helpful to reference in development. If you have some useful snippets, please feel free to open a PR into the appropriate file(s).

#### Resource Reference
For reference on the individual resources and the schema of the objects, please visit [developer.bigcommerce.com](https://developer.bigcommerce.com).

## Configuration
#### [Private Apps](configuration/legacy_auth.rb)
Public apps (also known as Single-Click Apps) must use OAuth authentication.

#### [Public Apps](configuration/oauth.rb)
To develop a custom integration for one store, your app needs to use Basic Authentication.

## Content
#### [Blog Posts](content/blog_post.rb)
A content entry in the store’s blog

#### [Blog Tags](content/blog_tag.rb)
Index of tags used on the store’s blog.

#### [Redirects](content/redirect.rb)
A 301 redirect, mapping from a given URL path to another URL

## Customers
#### [Customers](customers/customer.rb)
Identity and account details for customers shopping on Bigcommerce stores

#### [Customer Addresses](customers/customer_address.rb)
Postal address belonging to a Customer

#### [Customer Groups](customers/customer_group.rb)
Grouping of customers who share the same level of access and discounts at a store

## Geography
#### [Countries](geography/country.rb)
A country or territory, identifiable by an ISO 3166 country code

#### [States](geography/state.rb)
A state or province, identifiable by an ISO 3166 subdivision code

## Marketing
#### [Coupons](marketing/coupon.rb)
Applies a category or product discount to an order for customers who enter a given code

## Orders
#### [Orders](orders/order.rb)
The order object contains a record of the purchase agreement between a shopper and a merchant. 

#### [Order Coupons](orders/order_coupon.rb)
Coupon code applied to an order

#### [Order Messages](orders/order_message.rb)
Messages associated with an order.

#### [Order Products](orders/order_product.rb)
Product line items associated with an order.

#### [Order Shipping Addresses](orders/order_shipping_address.rb)
Shipping addresses associated with an order.

#### [Order Statuses](orders/order_status.rb)
Statuses that can be assigned to orders. Each status represents a state in the fulfilment workflow.

#### [Order Taxes](orders/order_tax.rb)
Taxes applied to an order.

#### [Shipments](orders/shipment.rb)
Shipping package consignments tracked from an order.

## Payments
#### [Payment Methods](payments/payment_methods.rb)
Enabled payment methods.

## Products
#### [Brands](products/brand.rb)
Brand facets for identifying and categorising products according to their manufacturer or company metonym.

#### [Bulk Pricing Rules](products/bulk_pricing_rule.rb)
Bulk pricing rules applied to a product.

#### [Categories](products/category.rb)
Index of hierarchical categories used to organise and group products.

#### [Configurable Fields ](products/configurable_field.rb)
Configurable fields associated with a product.

#### [Custom Fields](products/custom_field.rb)
Custom fields associated with a product.

#### [Google Product Search Mappings](products/google_product_search_mapping.rb)
Custom fields associated with a product.

#### [Options](products/option.rb)
Shared attributes that control value facets on a product.

#### [Option Sets](products/option_set.rb)
A reusable set of option facets that can be applied to products.

#### [Option Set Options](products/option_set_option.rb)
Options belonging to an option set.

#### [Option Values](products/option_value.rb)
Values that can be selected for an option.

#### [Products](products/product.rb)
Catalog of saleable items in the store.

#### [Product Images](products/product_image.rb)
Images associated with a product.

#### [Product Options](products/product_option.rb)
Options associated directly with a product.

#### [Product Reviews](products/product_review.rb)
Reviews associated to a product.

#### [Product Rules](products/product_rule.rb)
Rules that modify the default behaviour of products.

#### [Product Videos](products/product_video.rb)
Embedded videos displayed on product listings.

#### [SKUs](products/sku.rb)
Stock Keeping Unit identifiers associated with products.

## Shipping
#### [Shipping Methods](shipping/shipping_method.rb)
List of enabled shipping methods.

## Store
#### [Store Information](store/store_info.rb)
Metadata that describes the store.

## System
#### [Time](system/time.rb)
Timestamp ping to check the system status.

## Tax
#### [Tax Classes](tax/tax_class.rb)
Applies a category or product discount to an order for customers who enter a given code

## Webhooks
#### [Webhooks](webhooks/webhook.rb)
Applies a category or product discount to an order for customers who enter a given code

## Exception Handling
#### [Exceptions](exception_handling.rb)
All the errors we will throw with a convenient method to rescue the errors and take an action for each type
