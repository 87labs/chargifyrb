# frozen_string_literal: true

module Chargify
  class Configuration
    attr_accessor :adapter, :api_key, :enable_request_logger, :password, :subdomain, :user_agent

    def initialize(
      adapter: Faraday.default_adapter,
      api_key: nil,
      enable_request_logger: false,
      subdomain: nil,
      user_agent: %(Chargifyrb Ruby Gem #{Chargify::VERSION})
    )
      @adapter = adapter
      @api_key = api_key
      @enable_request_logger = enable_request_logger
      @password = "x"
      @subdomain = subdomain
      @user_agent = user_agent
    end

    def site
      %(https://#{@subdomain}.chargify.com)
    end
  end
end
