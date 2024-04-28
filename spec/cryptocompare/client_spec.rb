RSpec.describe Cryptocompare::Client do
  describe ".get" do
    it "same object" do
      client1 = Cryptocompare::Client.get
      client2 = Cryptocompare::Client.get
      expect(client1.object_id).to eq client2.object_id
    end
  end

  describe "have methods" do
    let(:client) { Cryptocompare::Client.new }

    it { expect(client.methods).to include(:single_symbol_price) }
    it { expect(client.methods).to include(:multiple_symbols_price) }
    it { expect(client.methods).to include(:multiple_symbols_full_data) }

    it { expect(client.methods).to include(:daily_pair_ohlcv) }
    it { expect(client.methods).to include(:hourly_pair_ohlcv) }
  end
end
