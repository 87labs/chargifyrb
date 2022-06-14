# frozen_string_literal: true

module Chargify
  class Client
    module Subscriptions
      def subscriptions
        get("subscriptions")
      end
    end
  end
end
