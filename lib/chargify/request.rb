# frozen_string_literal: true

require "chargify/models/response"

module Chargify
  module Request
    def get(path)
      request(:get, path)
    end

    private

    def request(method, path)
      handle_response(
        connection.send(method) do |request|
          request.url path
        end
      )
    end

    def handle_response(response)
      case response.status
      when 200...400
        ResponseRepresenter.new(Response.new).from_json(response.body)
      when 404
        raise NotFound, response
      else
        raise ConnectionError.new(response, "Unknown response code: #{response.code}")
      end
    end
  end
end
