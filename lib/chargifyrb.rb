# frozen_string_literal: true

require "chargifyrb/config"
require "chargifyrb/version"

module Chargifyrb
  class Error < StandardError; end

  class << self
    attr_writer :config
  end

  def self.config
    @config ||= Config.new
  end

  def self.configure
    yield config
  end
end
