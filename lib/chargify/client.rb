# frozen_string_literal: true

require "chargify/client/subscriptions"
require "chargify/client/product_families"
require "chargify/client/products"
require "chargify/client/coupons"
require "chargify/models/coupon"
require "chargify/models/product_family"
require "chargify/models/product"
require "chargify/models/subscription"
require "chargify/models/response"

module Chargify
  class Client
    extend Forwardable
    include Coupons
    include Products
    include ProductFamilies
    include Subscriptions

    attr_reader :config

    def_delegators :@config, :adapter
    def_delegators :@config, :api_key
    def_delegators :@config, :enable_request_logger
    def_delegators :@config, :password
    def_delegators :@config, :site
    def_delegators :@config, :subdomain
    def_delegators :@config, :user_agent

    def initialize(config)
      @config = config
    end

    def get(path, options = {})
      request(:get, path, options)
    end

    private

    def connection
      Faraday.new(connection_options) do |builder|
        builder.request :authorization, :basic, api_key, password
        builder.response :logger if enable_request_logger

        builder.adapter adapter
      end
    end

    def connection_options
      {
        headers: {
          "Accept" => "application/json; charset=utf-8",
          "Content-Type" => "application/json",
          "User-Agent" => user_agent
        },
        url: site
      }
    end

    def handle_response(response)
      case response.status
      when 200...400
        ResponseRepresenter.new(Response.new).from_json(response.body)
      when 404
        raise NotFoundError, response
      else
        raise ConnectionError.new(response, "Unknown response code: #{response.code}")
      end
    end

    def request(method, path, options)
      handle_response(
        connection.send(method) do |request|
          case method
          when :get
            request.url(path)
            request.params = options
          end
        end
      )
    end
  end
end
