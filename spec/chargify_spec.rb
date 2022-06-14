# frozen_string_literal: true

RSpec.describe Chargify do
  it "has a version number" do
    expect(Chargify::VERSION).not_to be_nil
  end

  describe ".configure" do
    subject(:config) { described_class.config }

    let(:api_key) { "key" }
    let(:subdomain) { "test" }

    before do
      described_class.configure do |config|
        config.api_key = api_key
        config.subdomain = subdomain
      end
    end

    it "sets config api_key" do
      expect(config.api_key).to eql api_key
    end

    it "sets config subdomain" do
      expect(config.subdomain).to eql subdomain
    end
  end

  describe ".respond_to_missing?" do
    context "when client respond to method" do
      it { expect(described_class).to be_respond_to_missing(:subscriptions) }
    end

    context "when client does not respond to method" do
      it { expect(described_class).not_to be_respond_to_missing(:unknown_method) }
    end
  end
end
