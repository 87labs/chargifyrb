# frozen_string_literal: true

require "forwardable"
require "chargify/connection"
require "chargify/request"

module Chargify
  class API
    extend Forwardable
    include Connection
    include Request

    attr_accessor :config

    def_delegators :@config,
                   :adapter,
                   :api_key,
                   :enable_request_logger,
                   :password,
                   :site,
                   :subdomain,
                   :user_agent

    def initialize(config)
      @config = config
    end
  end
end
