# frozen_string_literal: true

require "chargify/api"

module Chargify
  class Client < API
    autoload :Products,        "chargify/client/products"
    autoload :ProductFamilies, "chargify/client/product_families"
    autoload :Subscriptions,   "chargify/client/subscriptions"

    include Products
    include ProductFamilies
    include Subscriptions
  end
end
