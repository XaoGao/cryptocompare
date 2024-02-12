module Cryptocompare
  module Utils
    refine String do
      def to_camel_case
        split("_")
          .map.with_index { |value, index| index == 0 ? value.nil? ? "" : value : value.nil? ? "" : value.capitalize }
          .join
      end
    end
  end
end
