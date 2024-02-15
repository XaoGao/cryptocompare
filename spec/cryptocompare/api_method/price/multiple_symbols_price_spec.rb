RSpec.describe Cryptocompare::ApiMethod::Price::MultipleSymbolsPrice do
  let(:dummy_class) { Class.new { include Cryptocompare::ApiMethod::Price::MultipleSymbolsPrice } }
  let(:dummy_instance) { dummy_class.new }

  describe "#multiple_symbols_price" do
    it "correct url" do
      body = { BTC: { USD: 51_651.81, EUR: 47_961.5 }, ETH: { USD: 2_827.08, EUR: 2_625.28 } }

      stub_request(:get, "https://min-api.cryptocompare.com/data/pricemulti?tryConversion=true&fsyms=BTC,ETH&tsyms=USD,EUR")
        .to_return(status: 200, body: JSON.dump(body))

      response = dummy_instance.multiple_symbols_price(fsyms: %w[BTC ETH], tsyms: %w[USD EUR],
                                                       options: { try_conversion: true })
      expect(response.body).to eq(JSON.dump(body))
    end
  end
end
