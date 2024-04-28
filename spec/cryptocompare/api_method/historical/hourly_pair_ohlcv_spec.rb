RSpec.describe Cryptocompare::ApiMethod::Historical::HourlyPairOhlcv do
  let(:dummy_class) { Class.new { include Cryptocompare::ApiMethod::Historical::HourlyPairOhlcv } }
  let(:dummy_instance) { dummy_class.new }

  describe "#hourly_pair_ohlcv" do
    it "correct url" do
      body = { response: "success" }
      stub_request(:get, "https://min-api.cryptocompare.com/data/v2/histohour?fsym=BTC&tsym=USD&limit=1")
        .to_return(status: 200, body: JSON.dump(body))

      response = dummy_instance.hourly_pair_ohlcv(fsym: "BTC", tsym: "USD", options: { limit: 1 })

      expect(response.body).to eq("{\"response\":\"success\"}")
    end
  end
end
