module Cryptocompare
  class Client
    extend Configuration

    include Cryptocompare::ApiMethod::Price::SingleSymbolPrice
    include Cryptocompare::ApiMethod::Price::MultipleSymbolsPrice
    include Cryptocompare::ApiMethod::Price::MultipleSymbolsFullData
    include Cryptocompare::ApiMethod::Historical::DailyPairOhlcv
    include Cryptocompare::ApiMethod::Historical::HourlyPairOhlcv

    @@instance ||= new

    attr_reader :options

    def initialize(options: {})
      raise StandardError "options must be a hash" if options.class != Hash

      @options = options
    end

    def self.get
      @@instance
    end
  end
end
