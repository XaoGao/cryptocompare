module Cryptocompare
  module ApiMethod
    module Price
      module MultipleSymbolsFullData
        include Cryptocompare::ApiMethod::Base

        def multiple_symbols_full_data(fsyms:, tsyms:, options: {}, headers: {})
          MultipleSymbolsFullData.instance_method(:check_params).bind(self).call(fsyms:, tsyms:)

          avaliable_key = MultipleSymbolsFullData.instance_method(:avaliable_params).bind(self).call
          filtered_options = options.filter do |k, _|
            avaliable_key.include? k
          end

          query_params = create_query_params(options: filtered_options) do |o|
            o[:fsyms] = fsyms.join(",")
            o[:tsyms] = tsyms.join(",")
          end

          apikey_to_headers(query_params:, headers:)

          FaradayFactory.create(query_params:, headers:).get("/data/pricemultifull")
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