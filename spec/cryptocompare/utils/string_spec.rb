module Cryptocompare
  module Utils
    RSpec.describe String do
      using Utils

      describe "#to_camel_case" do
        it "convert string to camel case" do
          expect("some_value_is_here".to_camel_case).to eq("someValueIsHere")
        end

        it "double underscore in string" do
          expect("some__value_is__here".to_camel_case).to eq("someValueIsHere")
        end

        # TODO: fix
        # it "start string is underscore" do
        #   expect("_some_value_is_here".to_camel_case).to eq("someValueIsHere")
        # end
      end
    end
  end
end
