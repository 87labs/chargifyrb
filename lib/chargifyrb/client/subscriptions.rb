# frozen_string_literal: true

module Chargifyrb
  class Client
    module Subscriptions
      def subscriptions
        get("subscriptions")
      end
    end
  end
end
