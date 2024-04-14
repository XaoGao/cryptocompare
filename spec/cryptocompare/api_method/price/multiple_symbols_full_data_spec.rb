RSpec.describe Cryptocompare::ApiMethod::Price::MultipleSymbolsFullData do
  let(:dummy_class) { Class.new { include Cryptocompare::ApiMethod::Price::MultipleSymbolsFullData } }
  let(:dummy_instance) { dummy_class.new }

  describe "#multiple_symbols_full_data" do
    it "correct url" do
      body = { BTC: { USD: 51_651.81, EUR: 47_961.5 }, ETH: { USD: 2_827.08, EUR: 2_625.28 } }

      stub_request(:get, "https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH&tsyms=USD,EUR&tryConversion=true")
        .to_return(status: 200, body: JSON.dump(body))

      response = dummy_instance.multiple_symbols_full_data(fsyms: %w[BTC ETH], tsyms: %w[USD EUR],
                                                           options: { try_conversion: true, wrong_key: 1 })
      expect(response.body).to eq(JSON.dump(body))
    end
  end
end
