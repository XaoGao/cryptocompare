module Cryptocompare
  module ApiMethod
    using Cryptocompare::Utils

    module Base
      def create_query_params(options:)
        query_params = options.filter { |k, _| avaliable_params.include? k }
        yield query_params
        query_params.transform_keys_to_camel_case
      end

      def apikey_to_headers(query_params:, headers:)
        api_key = query_params.delete(:api_key)
        headers[:authorization] = "Apikey #{api_key}" unless api_key.nil?
      end
    end
  end
end
