module Cryptocompare
  module ApiMethod
    module Historical
      module HourlyPairOhlcv
        include ApiMethod::Base

        def hourly_pair_ohlcv(fsym:, tsym:, options: {}, headers: {})
          HourlyPairOhlcv.instance_method(:check_params).bind(self).call(fsym:, tsym:)

          filtered_options = filter_options(options:)
          query_params = create_query_params(options: filtered_options) do |o|
            o[:fsym] = fsym
            o[:tsym] = tsym
          end

          apikey_to_headers(query_params:, headers:)

          FaradayFactory.create(query_params:, headers:).get("/data/v2/histohour")
        end

        private

        def avaliable_params
          %i[try_conversion fsym tsym e aggregate aggregate_predictable_time_periods limit all_data toTs explain_path
             extra_params sign]
        end

        def filter_options(options:)
          avaliable_keys = HourlyPairOhlcv.instance_method(:avaliable_params).bind(self).call
          options.filter { |k, _| avaliable_keys.include? k }
        end

        def check_params(fsym:, tsym:)
          raise StandardError "fsym can not be nil" if fsym.nil?
          raise StandardError "tsym can not be nil" if tsym.nil?
        end
      end
    end
  end
end
