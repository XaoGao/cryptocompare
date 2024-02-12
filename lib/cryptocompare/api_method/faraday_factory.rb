module Cryptocompare
  module ApiMethod
    module FaradayFactory
      def self.create(query_params: nil)
        Faraday.new(
          url: "https://min-api.cryptocompare.com",
          params: query_params,
          headers: { "Content-Type" => "application/json" }
        )
      end
    end
  end
end
