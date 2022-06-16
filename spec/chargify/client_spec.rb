# frozen_string_literal: true

RSpec.describe Chargify::Client do
  subject(:client) do
    described_class.new(config)
  end

  let(:config) do
    Chargify::Configuration.new(api_key: api_key, subdomain: subdomain)
  end

  let(:api_key) { "key" }
  let(:subdomain) { "test" }

  describe "#read_subscription" do
    before do
      stub_request(:get, "https://test.chargify.com/subscriptions/1234")
        .with(
          headers: {
            "Accept" => "application/json; charset=utf-8",
            "Accept-Encoding" => "gzip;q=1.0,deflate;q=0.6,identity;q=0.3",
            "Authorization" => "Basic a2V5Ong=",
            "Content-Type" => "application/json",
            "User-Agent" => "Chargifyrb Ruby Gem #{Chargify::VERSION}"
          }
        )
        .to_return(status: status, body: {}.to_json)
    end

    context "when subscription exists" do
      let(:status) { 200 }

      before { client.read_subscription(1234) }

      it {
        expect(
          a_request(:get, "https://test.chargify.com/subscriptions/1234")
        ).to have_been_made.once
      }
    end

    context "when subscription does not exists" do
      let(:status) { 404 }

      it {
        expect do
          client.read_subscription(1234)
        end.to raise_error Chargify::NotFound
      }
    end
  end
end
