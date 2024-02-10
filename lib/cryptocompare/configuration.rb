module Cryptocompare
  module Configuration
    attr_accessor :try_conversion, :relaxed_validation, :e, :extra_params, :sign

    def configure
      yield self
    end
  end
end
