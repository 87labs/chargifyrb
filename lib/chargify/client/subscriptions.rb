# frozen_string_literal: true

module Chargify
  class Client
    module Subscriptions
      def read_subscription(id)
        response = get %(subscriptions/#{id})
        response.subscription
      end
    end
  end
end
