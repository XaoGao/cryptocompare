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

  describe "#apikey_to_headers" do
    let(:headers) { { some_key: "Some value" } }
    let(:query_params) { { first_key: "1", second_key: "2" } }
    before do
      dummy_instance.apikey_to_headers(query_params:, headers:)
    end

    context "when api key pass" do
      let(:query_params) { { first_key: "1", api_key: "123", second_key: "2" } }

      it "headers with authorization" do
        dummy_instance.apikey_to_headers(query_params:, headers:)
        expect(headers).to eq({ some_key: "Some value", authorization: "Apikey 123" })
      end
    end

    context "when api key not pass" do
      it "headers without authorization" do
        expect(headers).to eq({ some_key: "Some value" })
      end
    end

    it "query params without api key" do
      expect(query_params).to eq({ first_key: "1", second_key: "2" })
    end
  end
end
