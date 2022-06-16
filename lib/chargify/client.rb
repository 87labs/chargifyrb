# frozen_string_literal: true

require "chargify/api"

module Chargify
  class Client < API
    autoload(:Subscriptions, "chargify/client/subscriptions")

    include Subscriptions
  end
end
