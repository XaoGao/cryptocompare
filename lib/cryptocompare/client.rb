module Cryptocompare
  class Client
    extend Configuration
    include Cryptocompare::ApiMethod::Price::SingleSymbolPrice

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
