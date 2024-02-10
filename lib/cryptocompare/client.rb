module Cryptocompare
  class Client
    extend Configuration

    @@instance ||= new

    attr_reader :options

    def initialize(options = nil)
      raise StandardError "options must be a hash" if options.class != Hash

      @options = options
    end

    def self.get
      @@instance
    end
  end
end
