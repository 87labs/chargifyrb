# frozen_string_literal: true

module Chargifyrb
  class Client < API
    autoload(:Subscriptions, "chargifyrb/client/subscriptions")

    include Subscriptions
  end
end
