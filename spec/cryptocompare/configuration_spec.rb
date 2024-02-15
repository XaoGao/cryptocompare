module Cryptocompare
  RSpec.describe Configuration do
    let(:dummy_class) { Class.new { extend Configuration } }

    describe ".configure" do
      before do
        dummy_class.configure do |config|
          config.try_conversion = "try_conversion"
          config.relaxed_validation = "relaxed_validation"
          config.e = "e"
          config.extra_params = "extra_params"
          config.sign = "sign"
        end
      end

      it { expect(dummy_class.try_conversion).to eq "try_conversion" }
      it { expect(dummy_class.relaxed_validation).to eq "relaxed_validation" }
      it { expect(dummy_class.e).to eq "e" }
      it { expect(dummy_class.extra_params).to eq "extra_params" }
      it { expect(dummy_class.sign).to eq "sign" }
    end

    describe ".keys" do
      before do
        dummy_class.configure do |config|
          config.try_conversion = "try_conversion"
          config.relaxed_validation = "relaxed_validation"
          config.e = "e"
          config.sign = "sign"
        end
      end

      it do
        expect(dummy_class.keys).to eq({ try_conversion: "try_conversion", relaxed_validation: "relaxed_validation",
                                         e: "e", sign: "sign" })
      end
    end

    describe ".copy_keys_and_merge" do
      before do
        dummy_class.configure do |config|
          config.try_conversion = "try_conversion"
          config.relaxed_validation = "relaxed_validation"
          config.e = "e"
          config.sign = "sign"
        end
      end

      it "new object each time" do
        hash1 = dummy_class.copy_keys_and_merge(options: {})
        hash2 = dummy_class.copy_keys_and_merge(options: {})
        expect(hash1.object_id).not_to eq(hash2.object_id)
      end

      it "new object" do
        hash = dummy_class.copy_keys_and_merge(options: {})
        expect(hash.object_id).not_to eq(dummy_class.object_id)
      end

      it "rewrite values" do
        hash = dummy_class.copy_keys_and_merge(options: { e: "new value", new_key: "some value" })
        expect(hash).to eq({ try_conversion: "try_conversion", relaxed_validation: "relaxed_validation",
                             e: "new value", sign: "sign", new_key: "some value" })
      end
    end
  end
end
