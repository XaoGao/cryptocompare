module Cryptocompare
  module Utils
    refine Hash do
      def transform_keys_to_camel_case
        transform_keys { |key| key.to_s.to_camel_case.to_sym }
      end
    end
  end
end
