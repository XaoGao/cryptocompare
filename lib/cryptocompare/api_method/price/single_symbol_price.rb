module Cryptocompare
  module ApiMethod
    module Price
      module SingleSymbolPrice
        include Cryptocompare::ApiMethod::Base

        def single_symbol_price(fsym:, tsyms:, options: {}, headers: {})
          SingleSymbolPrice.instance_method(:check_params).bind(self).call(fsym:, tsyms:)

          filtered_options = filter_options(options:)

          query_params = create_query_params(options: filtered_options) do |o|
            o[:fsym] = fsym
            o[:tsyms] = tsyms.join(",")
          end

          apikey_to_headers(query_params:, headers:)

          FaradayFactory.create(query_params:, headers:).get("/data/price")
        end

        private

        def avaliable_params
          %i[try_conversion relaxed_validation e extra_params sign]
        end

        def filter_options(options:)
          avaliable_keys = SingleSymbolPrice.instance_method(:avaliable_params).bind(self).call
          options.filter { |k, _| avaliable_keys.include? k }
        end

        def check_params(fsym:, tsyms:)
          raise StandardError "fsym can not be nil" if fsym.nil?
          raise StandardError "tsyms must be hash and can not be empty" if tsyms.class != Array || tsyms.empty?
        end
      end
    end
  end
end
