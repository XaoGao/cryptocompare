RSpec.describe Cryptocompare::ApiMethod::Historical::DailyPairOhlcv do
  let(:dummy_class) { Class.new { include Cryptocompare::ApiMethod::Historical::DailyPairOhlcv } }
  let(:dummy_instance) { dummy_class.new }

  describe "#daily_pair_ohlcv" do
    it "correct url" do
      body = { response: "success" }
      stub_request(:get, "https://min-api.cryptocompare.com/data/v2/histoday?fsym=BTC&tsym=USD&limit=1")
        .to_return(status: 200, body: JSON.dump(body))

      response = dummy_instance.daily_pair_ohlcv(fsym: "BTC", tsym: "USD", options: { limit: 1 })

      expect(response.body).to eq("{\"response\":\"success\"}")
    end
  end
end
