# frozen_string_literal: true

RSpec.describe Chargify::Configuration do
  subject(:config) do
    described_class.new
  end

  describe "initialize" do
    it "sets default password" do
      expect(config.password).to eql "x"
    end

    it "sets nil subdomain" do
      expect(config.subdomain).to be_nil
    end

    it "sets nil api_key" do
      expect(config.api_key).to be_nil
    end
  end

  describe "#site" do
    let(:subdomain) { "test" }

    before { config.subdomain = subdomain }

    it "returns chargify site" do
      expect(config.site).to eql %(https://#{subdomain}.chargify.com)
    end
  end
end
