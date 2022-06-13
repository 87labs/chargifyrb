# frozen_string_literal: true

RSpec.describe Chargifyrb do
  it "has a version number" do
    expect(Chargifyrb::VERSION).not_to be_nil
  end

  describe ".configure" do
    subject(:config) { described_class.config }

    before do
      described_class.configure do |config|
        config.api_key = "api_key"
        config.subdomain = "test-local"
      end
    end

    it "sets config api_key" do
      expect(config.api_key).to eql "api_key"
    end

    it "sets config subdomain" do
      expect(config.subdomain).to eql "test-local"
    end
  end
end
