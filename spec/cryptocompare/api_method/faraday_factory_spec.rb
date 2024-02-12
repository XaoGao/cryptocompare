RSpec.describe Cryptocompare::ApiMethod::FaradayFactory do
  describe ".create" do
    let(:conn) { Cryptocompare::ApiMethod::FaradayFactory.create(query_params: { limit: 10 }) }

    it { expect(conn.class).to eq(Faraday::Connection) }
    it { expect(conn.url_prefix).to eq(URI("https://min-api.cryptocompare.com")) }
    it { expect(conn.params).to eq({ "limit" => 10 }) }
  end
end
