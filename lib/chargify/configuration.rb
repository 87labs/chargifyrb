# frozen_string_literal: true

module Chargify
  class Configuration
    attr_accessor :adapter, :api_key, :enable_request_logger, :subdomain, :user_agent

    attr_reader :base_uri, :password

    def initialize
      @adapter = Faraday.default_adapter
      @base_uri = "https://%s.chargify.com"
      @enable_request_logger = false
      @password = "x"
      @user_agent = %(Chargifyrb Ruby Gem #{Chargify::VERSION})
    end

    def site
      format(@base_uri, @subdomain)
    end
  end
end
