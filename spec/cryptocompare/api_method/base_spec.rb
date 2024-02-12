RSpec.describe Cryptocompare::ApiMethod::Base do
  let(:dummy_class) { Class.new { include Cryptocompare::ApiMethod::Base } }
  let(:dummy_instance) { dummy_class.new }
  let(:options) { { some_key: "some_value", wrong_key: 1 } }

  describe "#create_query_params" do
    before do
      allow(dummy_instance).to receive(:avaliable_params).and_return([:some_key])
    end

    it do
      result = dummy_instance.create_query_params(options: { some_key: "some_value" }) do |o|
        o[:new_key] = "test_value"
      end

      expect(result).to eq({ someKey: "some_value", newKey: "test_value" })
    end
  end
end
