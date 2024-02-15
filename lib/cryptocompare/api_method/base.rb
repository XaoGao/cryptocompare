module Cryptocompare
  module ApiMethod
    using Cryptocompare::Utils

    module Base
      def create_query_params(options:)
        query_params = options.filter { |k, _| avaliable_params.include? k }
        yield query_params
        query_params.transform_keys_to_camel_case
      end
    end
  end
end
