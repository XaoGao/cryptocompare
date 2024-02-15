module Cryptocompare
  module ApiMethod
    module Price
      module MultipleSymbolsPrice
        include Cryptocompare::ApiMethod::Base

        def multiple_symbols_price(fsyms:, tsyms:, options: {}, headers: {})
          check_params(fsyms:, tsyms:)

          api_key = options.delete(:api_key)
          headers["Authorization"] = "Apikey #{api_key}" unless api_key.nil?

          query_params = create_query_params(options:) do |o|
            o[:fsyms] = fsyms.join(",")
            o[:tsyms] = tsyms.join(",")
          end

          Cryptocompare::ApiMethod::FaradayFactory.create(query_params:, headers:).get("/data/pricemulti")
        end

        private

        def avaliable_params
          %i[try_conversion relaxed_validation e extra_params sign]
        end

        def check_params(fsyms:, tsyms:)
          raise StandardError "fsyms must be hash and can not be empty" if fsyms.class != Array || fsyms.empty?
          raise StandardError "tsyms must be hash and can not be empty" if tsyms.class != Array || tsyms.empty?
        end
      end
    end
  end
end
