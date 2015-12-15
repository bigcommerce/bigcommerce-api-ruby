# Product
# Catalog of saleable items in the store.
# https://developer.bigcommerce.com/api/stores/v2/products

module Bigcommerce
  class Product < Resource
    include Bigcommerce::ResourceActions.new uri: 'products/%d'

    property :id
    property :count
    property :keyword_filter
    property :name
    property :type
    property :sku
    property :description
    property :search_keywords
    property :availability_description
    property :price
    property :cost_price
    property :retail_price
    property :sale_price
    property :calculated_price
    property :sort_order
    property :is_visible
    property :is_featured
    property :related_products
    property :inventory_level
    property :inventory_warning_level
    property :warranty
    property :weight
    property :width
    property :height
    property :depth
    property :fixed_cost_shipping_price
    property :is_free_shipping
    property :inventory_tracking
    property :rating_total
    property :rating_count
    property :total_sold
    property :date_created
    property :brand_id
    property :view_count
    property :page_title
    property :meta_keywords
    property :meta_description
    property :layout_file
    property :is_price_hidden
    property :price_hidden_label
    property :categories
    property :date_modified
    property :event_date_field_name
    property :event_date_type
    property :event_date_start
    property :event_date_end
    property :myob_asset_account
    property :myob_income_account
    property :myob_expense_account
    property :peachtree_gl_account
    property :condition
    property :is_condition_shown
    property :preorder_release_date
    property :is_preorder_only
    property :preorder_message
    property :order_quantity_minimum
    property :order_quantity_maximum
    property :open_graph_type
    property :open_graph_title
    property :open_graph_description
    property :is_open_graph_thumbnail
    property :upc
    property :date_last_imported
    property :option_set_id
    property :tax_class_id
    property :option_set_display
    property :bin_picking_number
    property :custom_url
    property :availability
    property :brand
    property :downloads
    property :images
    property :discount_rules
    property :configurable_fields
    property :custom_fields
    property :videos
    property :skus
    property :rules
    property :option_set
    property :options
    property :tax_class
    property :avalara_product_tax_code
    property :primary_image
    property :metadata, transform_with: (lambda do |value|
      result = []
      value.keys.each do |key|
        value[key].each do |obj|
          result << {
            namespace: key,
            key: obj.try(:[], :key),
            value: obj.try(:[], :value)
          }
        end
      end
      result
    end)

    def self.count(params = {})
      get 'products/count', params
    end
  end
end
