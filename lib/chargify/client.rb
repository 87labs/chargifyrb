# frozen_string_literal: true

module Chargify
  class Client < API
    autoload(:Subscriptions, "chargify/client/subscriptions")

    include Subscriptions
  end
end
