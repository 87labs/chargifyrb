# frozen_string_literal: true

require "chargify/models/response"

module Chargify
  module Request
    def get(path, options = {})
      request(:get, path, options)
    end

    private

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
  end
end
