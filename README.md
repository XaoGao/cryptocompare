# Cryptocompare Api
Gem **cryptocompare** Ruby library provides convenient access to the cryptocompare from applications written in the Ruby language. 

See documentation: [API docs](https://min-api.cryptocompare.com/documentation).

<!-- markdown-toc start - Don't edit this section. Run M-x markdown-toc-refresh-toc -->
**Table of Contents**

- [Cryptocompare Api](#cryptocompare-api)
    - [Installation](#installation)
    - [Usage](#usage)
        - [Configuration](#configuration)
        - [Methods](#methods)
            - [single_symbol_price](#single_symbol_price)
                - [Params](#params)
                - [Options](#options)
    - [Middleware](#middleware)
    - [Contributing](#contributing)

<!-- markdown-toc end -->

## Installation
Add this line to your application's Gemfile:
```ruby
gem 'cryptocompare'
```
And then execute:
```
bundle install
```
## Usage

### Configuration

You can configure the client for each request or confugre factory with defualt values:

```ruby
require 'cryptocompare'

Cryptocompare::Client.configure do |config|
  config.api_key = "YOUR_API_KEY"
  config.pure_hash = true
  # ...
end

client = Cryptocompare::Client.get(options) # Options rewrite default values, not require
# or
client = Cryptocompare::Client.new(api_key: "YOUR_API_KEY", options)
```

### Methods
#### single_symbol_price
Single Symbol Price. Get the current price of any cryptocurrency in any other currency that you need.

If the crypto does not trade directly into the to Symbol requested, BTC will be used for conversion. If the opposite pair trades we invert it (eg.: BTC-XMR)

##### Params
* **fsym *string* Required**
The cryptocurrency symbol of interest [ Min length - 1] [ Max length - 30]
* **tsyms *array by string* Required**
Comma separated cryptocurrency symbols list to convert into [ Min length - 1] [ Max length - 500]

##### Options
1. **try_conversion *boolean***
If set to false, it will try to get only direct trading values. This parameter is only valid for e=CCCAGG value [ Default - **true**]
2. **relaxed_validation *boolean***
Setting this to true will make sure you don't get an error on non trading pairs, they will just be filtered out of the response. [ Default - **true**]
3. **e *string***
The exchange to obtain data from [ Min length - 2] [ Max length - 30] [ Default - **cccagg_or_exchange**]
4. **extra_params *string***
The name of your application (we recommend you send it) [ Min length - 1] [ Max length - 2000] [ Default - **NotAvailable**]
5. **sign *boolean***
If set to true, the server will sign the requests (by default we don't sign them), this is useful for usage in smart contracts [ Default - **false**]
6. **pure_hash *boolean***
If set to true, the server will return the hash instead of the response (Convert will be throught default JSON.parse) [ Default - **false**]

To get the data, you need to call the method:
```ruby
response = client.single_symbol_price(fsym: "BTC", tsyms: ["ETH", "USD"])
```

## Middleware
Gem use a faraday for http request, you can set middleaware, example:
```ruby
response = client.convert(fsym: "BTC", tsyms: ["ETH", "USD"]) do |f|
  f.request :json
  f.request :logger
  f.response :json
  f.adapter :net_http
  # ...
end
```

## Contributing

Everyone is encouraged to help improve this project. Here are a few ways you can help:

- [Report bugs](https://github.com/XaoGao/cryptocompare_api/issues)
- Fix bugs and [submit pull requests](https://github.com/XaoGao/cryptocompare/pulls)
- Write, clarify, or fix documentation
- Suggest or add new features
