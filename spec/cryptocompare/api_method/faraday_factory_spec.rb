RSpec.describe Cryptocompare::ApiMethod::FaradayFactory do
  describe ".create" do
    let(:conn) do
      Cryptocompare::ApiMethod::FaradayFactory.create(query_params: { limit: 10 }, headers: { api_key: "123" })
    end

    it { expect(conn.class).to eq(Faraday::Connection) }
    it { expect(conn.url_prefix).to eq(URI("https://min-api.cryptocompare.com")) }
    it { expect(conn.params).to eq({ "limit" => 10 }) }
    # it { expect(conn.headers).to have_key(:api_key) }
  end
end
