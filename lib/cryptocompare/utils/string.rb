module Cryptocompare
  module Utils
    refine String do
      def to_camel_case
        split("_")
          .map.with_index do |value, index|
          if index.zero?
            value.nil? ? "" : value
          else
            value.nil? ? "" : value.capitalize
          end
        end
          .join
      end
    end
  end
end
