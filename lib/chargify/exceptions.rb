# frozen_string_literal: true

module Chargify
  class ConnectionError < StandardError
    attr_reader :details, :status

    def initialize(response, message = nil)
      @details = JSON.parse(response.body)["errors"]
      @details = response.reason_phrase if @details && @details.empty?
      @message = message
      @status = response.status

      super(to_s)
    end

    def to_s
      return @message if @message

      %(Failed. Response code = #{status}. Response message = #{details})
    end
  end

  NotFoundError = Class.new(ConnectionError)
end
