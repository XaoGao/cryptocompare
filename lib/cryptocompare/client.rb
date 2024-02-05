module Cryptocompare
  class Client
    @@instance ||= new

    def self.get
      @@instance
    end
  end
end
