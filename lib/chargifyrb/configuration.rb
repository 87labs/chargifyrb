# frozen_string_literal: true

module Chargifyrb
  class Configuration
    attr_accessor :adapter, :api_key, :password, :subdomain, :user_agent

    def initialize(
      adapter: Faraday.default_adapter,
      api_key: nil,
      subdomain: nil,
      user_agent: %(Chargifyrb Ruby Gem #{Chargifyrb::VERSION})
    )
      @adapter = adapter
      @api_key = api_key
      @password = "x"
      @subdomain = subdomain
      @user_agent = user_agent
    end

    def site
      %(https://#{@subdomain}.chargify.com)
    end
  end
end
