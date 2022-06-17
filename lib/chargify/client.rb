# frozen_string_literal: true

require "chargify/api"

module Chargify
  class Client < API
    autoload :Products,      "chargify/client/products"
    autoload :Subscriptions, "chargify/client/subscriptions"

    include Products
    include Subscriptions
  end
end
