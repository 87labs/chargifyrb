# frozen_string_literal: true

module Chargify
  module Connection
    private

    def connection
      Faraday.new(options) do |builder|
        builder.request :authorization, :basic, api_key, password
        builder.request :json
        builder.response :logger if enable_request_logger

        builder.adapter adapter
      end
    end

    def options
      {
        headers: {
          "Accept" => "application/json; charset=utf-8",
          "Content-Type" => "application/json",
          "User-Agent" => user_agent
        },
        url: site
      }
    end
  end
end
