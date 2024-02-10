module Cryptocompare
  RSpec.describe Client do
    describe ".get" do
      it "same object" do
        client1 = Cryptocompare::Client.get
        client2 = Cryptocompare::Client.get
        expect(client1.object_id).to eq client2.object_id
      end
    end
  end
end
