module Cryptocompare
  module ApiMethod
    module FaradayFactory
      def self.create(query_params: nil, headers: {})
        Faraday.new(
          url: "https://min-api.cryptocompare.com",
          params: query_params,
          headers: headers.merge({ "Content-Type" => "application/json" })
        )
      end
    end
  end
end
