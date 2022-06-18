# frozen_string_literal: true

module Chargify
  Response = Class.new(OpenStruct)

  class ResponseRepresenter < Representable::Decorator
    include Representable::JSON

    property :coupon, decorator: CouponRepresenter, class: Coupon
    property :product, decorator: ProductRepresenter, class: Product
    property :product_family, decorator: ProductFamilyRepresenter, class: ProductFamily
    property :subscription, decorator: SubscriptionRepresenter, class: Subscription
  end
end
