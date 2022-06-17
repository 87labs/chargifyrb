# frozen_string_literal: true

require "chargify/models/product_family"
require "chargify/models/product"
require "chargify/models/subscription"

module Chargify
  Response = Class.new(OpenStruct)

  class ResponseRepresenter < Representable::Decorator
    include Representable::JSON

    property :product, decorator: ProductRepresenter, class: Product
    property :product_family, decorator: ProductFamilyRepresenter, class: ProductFamily
    property :subscription, decorator: SubscriptionRepresenter, class: Subscription
  end
end
