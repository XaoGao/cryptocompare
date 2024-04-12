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

    it "single_symbol_price" do
      expect(client.methods).to include(:single_symbol_price)
    end

    it "single_symbol_price" do
      expect(client.methods).to include(:single_symbol_price)
    end

    it "daily_pair_ohlcv" do
      expect(client.methods).to include(:daily_pair_ohlcv)
    end
  end
end
