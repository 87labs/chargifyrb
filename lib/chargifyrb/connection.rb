# frozen_string_literal: true

module Chargifyrb
  module Connection
    private

    def connection
      Faraday.new(options) do |builder|
        builder.use Faraday::Request::Authorization, :basic, api_key, password
        builder.use Faraday::Response::Logger
        builder.use Faraday::Response::Json
        builder.use Faraday::Response::RaiseError

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
