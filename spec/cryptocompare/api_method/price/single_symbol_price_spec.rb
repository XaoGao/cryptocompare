RSpec.describe Cryptocompare::ApiMethod::Price::SingleSymbolPrice do
  let(:dummy_class) { Class.new { include Cryptocompare::ApiMethod::Price::SingleSymbolPrice } }
  let(:dummy_instance) { dummy_class.new }

  describe ".single_symbol_price" do
    it "correct url" do
      body = { "USD": 48_455.05, "JPY": 7_209_990.21, "EUR": 44_663.17 }
      stub_request(:get, "https://min-api.cryptocompare.com/data/price?tryConversion=true&fsym=BTC&tsyms=USD,JPY,EUR")
        .to_return(status: 200, body: JSON.dump(body))

      response = dummy_instance.single_symbol_price(fsym: "BTC", tsyms: %w[USD JPY EUR],
                                                    options: { try_conversion: true })
      expect(response.body).to eq("{\"USD\":48455.05,\"JPY\":7209990.21,\"EUR\":44663.17}")
    end
  end
end
