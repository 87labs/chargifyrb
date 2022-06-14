# frozen_string_literal: true

module Chargifyrb
  module Request
    def get(path)
      request(:get, path)
    end

    private

    def request(method, path)
      connection.send(method) do |request|
        request.url(CGI.escape(path))
      end
    end
  end
end
