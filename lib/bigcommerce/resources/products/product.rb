# Product
# Catalog of saleable items in the store.
# https://developer.bigcommerce.com/api/stores/v2/products

module Bigcommerce
  class Product < Resource
    include Bigcommerce::ResourceActions.new uri: 'products/%d'

    property :id
    property :sku
    property :upc
    property :name
    property :skus
    property :type
    property :brand
    property :depth
    property :price
    property :rules
    property :width
    property :height
    property :images
    property :videos
    property :weight
    property :options
    property :brand_id
    property :warranty
    property :condition
    property :downloads
    property :tax_class
    property :categories
    property :cost_price
    property :custom_url
    property :is_visible
    property :option_set
    property :page_title
    property :sale_price
    property :sort_order
    property :total_sold
    property :view_count
    property :description
    property :is_featured
    property :layout_file
    property :availability
    property :date_created
    property :rating_count
    property :rating_total
    property :retail_price
    property :tax_class_id
    property :custom_fields
    property :date_modified
    property :meta_keywords
    property :option_set_id
    property :discount_rules
    property :event_date_end
    property :keyword_filter
    property :event_date_type
    property :inventory_level
    property :is_price_hidden
    property :open_graph_type
    property :search_keywords
    property :calculated_price
    property :event_date_start
    property :is_free_shipping
    property :is_preorder_only
    property :meta_description
    property :open_graph_title
    property :preorder_message
    property :related_products
    property :bin_picking_number
    property :date_last_imported
    property :inventory_tracking
    property :is_condition_shown
    property :myob_asset_account
    property :option_set_display
    property :price_hidden_label
    property :configurable_fields
    property :myob_income_account
    property :myob_expense_account
    property :peachtree_gl_account
    property :event_date_field_name
    property :preorder_release_date
    property :open_graph_description
    property :order_quantity_maximum
    property :order_quantity_minimum
    property :inventory_warning_level
    property :is_open_graph_thumbnail
    property :availability_description
    property :avalara_product_tax_code
    property :fixed_cost_shipping_price
    property :primary_image
    property :count
    property :variants

    def self.count(params = {})
      get 'products/count', params
    end
  end
end
