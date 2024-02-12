module Cryptocompare
  module Utils
    RSpec.describe Hash do
      using Utils

      describe "#transform_keys_to_camel_case" do
        context "when keys is symbol" do
          let(:hash) { { first_key: "1", second_key: "2", another_key_with_many_underscore: "3" } }

          it "get hash with camel case keys" do
            expect(hash.transform_keys_to_camel_case).to eq({ firstKey: "1", secondKey: "2",
                                                              anotherKeyWithManyUnderscore: "3" })
          end
        end

        context "when keys is string" do
          let(:hash) { { "first_key" => "1", "second_key" => "2", "another_key_with_many_underscore" => "3" } }

          it "get hash with camel case keys" do
            expect(hash.transform_keys_to_camel_case).to eq({ firstKey: "1", secondKey: "2",
                                                              anotherKeyWithManyUnderscore: "3" })
          end
        end
      end
    end
  end
end
