module Cryptocompare
  module Configuration
    attr_accessor :try_conversion, :relaxed_validation, :e, :extra_params, :sign

    def configure
      yield self
    end

    def keys
      @keys ||= { try_conversion:, relaxed_validation:, e:, extra_params:, sign: }.compact!
    end

    def copy_keys_and_merge(options:)
      keys.clone.merge(options)
    end
  end
end
