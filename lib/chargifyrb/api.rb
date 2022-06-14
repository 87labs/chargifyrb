# frozen_string_literal: true

require "forwardable"
require "chargifyrb/connection"
require "chargifyrb/request"

module Chargifyrb
  class API
    extend Forwardable
    include Connection
    include Request

    attr_accessor :config

    def_delegators :@config,
                   :adapter,
                   :api_key,
                   :password,
                   :site,
                   :subdomain,
                   :user_agent

    def initialize(config)
      @config = config
    end
  end
end
