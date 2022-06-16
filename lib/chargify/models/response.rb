# frozen_string_literal: true

require "chargify/models/subscription"

module Chargify
  Response = Class.new(OpenStruct)

  class ResponseRepresenter < Representable::Decorator
    include Representable::JSON

    property :subscription, decorator: SubscriptionRepresenter, class: Subscription
  end
end
