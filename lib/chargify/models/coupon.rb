# frozen_string_literal: true

module Chargify
  Coupon = Class.new(OpenStruct)

  CouponRestriction = Class.new(OpenStruct)

  class CouponRepresenter < Representable::Decorator
    include Representable::JSON

    property :allow_negative_balance
    property :amount
    property :amount_in_cents
    property :apply_on_cancel_at_end_of_period
    property :apply_on_subscription_expiration
    property :archived_at
    property :code
    property :compounding_strategy
    property :conversion_limit
    collection :coupon_restrictions, class: CouponRestriction do
      property :handler
      property :id
      property :item_id
      property :item_type
      property :name
    end
    property :created_at
    property :description
    property :discount_type
    property :duration_interval
    property :duration_interval_span
    property :duration_interval_unit
    property :duration_period_count
    property :end_date
    property :exclude_mid_period_allocations
    property :id
    property :name
    property :percentage
    property :product_family_id
    property :product_family_name
    property :recurring
    property :recurring_scheme
    property :stackable
    property :start_date
    property :updated_at
    property :use_site_exchange_rate
  end
end
