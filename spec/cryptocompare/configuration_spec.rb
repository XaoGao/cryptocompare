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
  end
end
