module Cryptocompare
  module ApiMethod
    module Historical
      module DailyPairOhlcv
        include ApiMethod::Base

        def daily_pair_ohlcv(fsym:, tsym:, options: {}, headers: {})
          DailyPairOhlcv.instance_method(:check_params).bind(self).call(fsym:, tsym:)

          avaliable_keys = DailyPairOhlcv.instance_method(:avaliable_params).bind(self).call
          filtered_options = options.filter do |k, _|
            avaliable_keys.include? k
          end

          query_params = create_query_params(options: filtered_options) do |o|
            o[:fsym] = fsym
            o[:tsym] = tsym
          end

          apikey_to_headers(query_params:, headers:)

          FaradayFactory.create(query_params:, headers:).get("/data/v2/histoday")
        end

        private

        def avaliable_params
          %i[try_conversion fsym tsym e aggregate aggregate_predictable_time_periods limit all_data toTs explain_path
             extra_params sign]
        end

        def check_params(fsym:, tsym:)
          raise StandardError "fsym can not be nil" if fsym.nil?
          raise StandardError "tsym must be hash and can not be empty" if tsym.nil?
        end
      end
    end
  end
end
