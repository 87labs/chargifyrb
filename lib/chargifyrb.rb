# frozen_string_literal: true

require "faraday"
require "chargifyrb/api"
require "chargifyrb/client"
require "chargifyrb/configuration"
require "chargifyrb/version"

module Chargifyrb
  def self.client
    Client.new(config)
  end

  def self.configure
    yield(config)
  end

  def self.method_missing(method, *args, &block)
    return super unless client.respond_to?(method)

    client.send(method, *args, &block)
  end

  def self.respond_to_missing?(method, include_all = false)
    client.respond_to?(method, include_all) || false
  end

  private_class_method def self.config
    @config ||= Configuration.new
  end
end
