# frozen_string_literal: true

module Chargify
  Product = Class.new(OpenStruct)

  ProductFamily = Class.new(OpenStruct)

  PublicSignupPages = Class.new(OpenStruct)

  class ProductRepresenter < Representable::Decorator
    include Representable::JSON

    property :accounting_code
    property :archived_at
    property :created_at
    property :default_product_price_point_id
    property :description
    property :expiration_interval
    property :expiration_interval_unit
    property :handle
    property :id
    property :initial_charge_after_trial
    property :initial_charge_in_cents
    property :interval
    property :interval_unit
    property :name
    property :price_in_cents
    property :product_family, class: ProductFamily do
      property :accounting_code
      property :created_at
      property :description
      property :handle
      property :id
      property :name
      property :updated_at
    end
    property :product_price_point_handle
    property :product_price_point_id
    property :product_price_point_name
    collection :public_signup_pages, class: PublicSignupPages do
      property :id
      property :return_params
      property :return_url
      property :url
    end
    property :request_billing_address
    property :request_credit_card
    property :require_billing_address
    property :require_credit_card
    property :require_shipping_address
    property :return_params
    property :tax_code
    property :taxable
    property :trial_interval
    property :trial_interval_unit
    property :trial_price_in_cents
    property :update_return_params
    property :update_return_url
    property :updated_at
    property :version_number
  end
end
