# frozen_string_literal: true

module Chargify
  class ConnectionError < StandardError
    attr_reader :response

    def initialize(response, message = nil)
      @response = response
      @message = message

      super(to_s)
    end

    def to_s
      return @message if @message

      message = +"Failed."
      message << " Response code = #{response.status}." if response.respond_to?(:status)
      message << " Response message = #{response.reason_phrase}." if response.respond_to?(:reason_phrase)
      message
    end
  end

  NotFound = Class.new(ConnectionError)
end
