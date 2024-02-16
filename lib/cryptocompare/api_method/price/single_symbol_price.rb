module Cryptocompare
  module ApiMethod
    module Price
      module SingleSymbolPrice
        include Cryptocompare::ApiMethod::Base

        def single_symbol_price(fsym:, tsyms:, options: {}, headers: {})
          check_params(fsym:, tsyms:)

          query_params = create_query_params(options:) do |o|
            o[:fsym] = fsym
            o[:tsyms] = tsyms.join(",")
          end

          apikey_to_headers(query_params:, headers:)

          Cryptocompare::ApiMethod::FaradayFactory.create(query_params:, headers:).get("/data/price")
        end

        private

        def avaliable_params
          %i[try_conversion relaxed_validation e extra_params sign]
        end

        def check_params(fsym:, tsyms:)
          raise StandardError "fsym can not be nil" if fsym.nil?
          raise StandardError "tsyms must be hash and can not be empty" if tsyms.class != Array || tsyms.empty?
        end
      end
    end
  end
end
