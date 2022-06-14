# frozen_string_literal: true

RSpec.describe Chargifyrb::Configuration do
  subject(:config) do
    described_class.new(api_key: api_key, subdomain: subdomain)
  end

  let(:api_key) { "key" }
  let(:subdomain) { "test" }

  describe "initialize" do
    it "sets default password" do
      expect(config.password).to eql "x"
    end

    it "sets subdomain" do
      expect(config.subdomain).to eql subdomain
    end

    it "sets api_key" do
      expect(config.api_key).to eql api_key
    end
  end

  describe "#site" do
    it "returns chargify site" do
      expect(config.site).to eql %(https://#{subdomain}.chargify.com)
    end
  end
end
