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
            - [Price](#price)
                - [single_symbol_price](#single_symbol_price)
                    - [Params](#params)
                    - [Options](#options)
                - [multiple_symbol_price](#multiple_symbol_price)
                    - [Params](#params-1)
                    - [Options](#options-1)
                - [multiple_symbol_full_data](#multiple_symbol_full_data)
                    - [Params](#params-2)
                    - [Options](#options-2)
            - [Historical](#historical)
                - [daily_pair_ohlcv](#daily_pair_ohlcv)
                    - [Params](#params-3)
                    - [Options](#options-3)
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

#### Price

##### single_symbol_price
Single Symbol Price. Get the current price of any cryptocurrency in any other currency that you need.

If the crypto does not trade directly into the to Symbol requested, BTC will be used for conversion. If the opposite pair trades we invert it (eg.: BTC-XMR)

###### Params
* **fsym *string* Required**
The cryptocurrency symbol of interest [ Min length - 1] [ Max length - 30]
* **tsyms *array by string* Required**
Comma separated cryptocurrency symbols list to convert into [ Min length - 1] [ Max length - 500]

###### Options
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

To get the data, you need to call the method:
```ruby
response = client.single_symbol_price(fsym: "BTC", tsyms: ["ETH", "USD"])
```

##### multiple_symbol_price
Multiple Symbol Price. Same as single API path but with multiple from symbols.

###### Params
* **fsyms *string* Required**
Comma separated cryptocurrency symbols list [ Min length - 1] [ Max length - 300]
* **tsyms *array by string* Required**
Comma separated cryptocurrency symbols list to convert into [ Min length - 1] [ Max length - 100]

###### Options
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

To get the data, you need to call the method:
```ruby
response = client.multiple_symbol_price(fsyms: ["BTC", "ETH"], tsyms: ["USD", "EUR"])
```

##### multiple_symbol_full_data
Get all the current trading info (price, vol, open, high, low etc) of any list of cryptocurrencies in any other currency that you need. If the crypto does not trade directly into the toSymbol requested, BTC will be used for conversion.
This API also returns Display values for all the fields. If the opposite pair trades we invert it (e.g. BTC-XMR)

###### Params
* **fsyms *string* Required**
Comma separated cryptocurrency symbols list [ Min length - 1] [ Max length - 1000]
* **tsyms *array by string* Required**
Comma separated cryptocurrency symbols list to convert into [ Min length - 1] [ Max length - 100]

###### Options
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

To get the data, you need to call the method:
```ruby
response = client.multiple_symbol_full_data(fsyms: ["BTC", "ETH"], tsyms: ["USD", "EUR"])
```

#### Historical

##### daily_pair_ohlcv
Get open, high, low, close, volumefrom and volumeto from the daily historical data. The values are based on 00:00 GMT time. If e=CCCAGG and tryConversion=true, it attempts conversion through BTC or ETH to determine the best possible path. The conversion type and symbol used are appended per historical point. If you want to get all the available historical data, you can use limit=2000 and keep going back in time using the toTs param. You can then keep requesting batches using: &limit=2000&toTs={the earliest timestamp received}.

###### Params
* **fsym *string* Required**
The cryptocurrency symbol of interest [ Min length - 1] [ Max length - 30]
* **tsym *array by string* Required**
The currency symbol to convert into [ Min length - 1] [ Max length - 30]

###### Options
1. **try_conversion *boolean***
If set to false, it will try to get only direct trading values. This parameter is only valid for e=CCCAGG value [ Default - **true**]
2. **relaxed_validation *boolean***
Setting this to true will make sure you don't get an error on non trading pairs, they will just be filtered out of the response. [ Default - **true**]
3. **e *string***
The exchange to obtain data from [ Min length - 2] [ Max length - 30] [ Default - **cccagg_or_exchange**]
4. **aggregate *int***
Time period to aggregate the data over (for daily it's days, for hourly it's hours and for minute histo it's minutes) [ Min - 1] [ Max - 30] [ **Default** - 1]
5. **aggregate_predictable_time_periods *boolean***
Only used when the aggregate param is also in use. If false it will aggregate based on the current time.If the param is false and the time you make the call is 1pm - 2pm, with aggregate 2, it will create the time slots: ... 9am, 11am, 1pm.If the param is false and the time you make the call is 2pm - 3pm, with aggregate 2, it will create the time slots: ... 10am, 12am, 2pm.If the param is true (default) and the time you make the call is 1pm - 2pm, with aggregate 2, it will create the time slots: ... 8am, 10am, 12pm.If the param is true (default) and the time you make the call is 2pm - 3pm, with aggregate 2, it will create the time slots: ... 10am, 12am, 2pm. [ Default - **true**]
6. **limit *int***
The number of data points to return. If limit * aggregate > 2000 we reduce the limit param on our side. So a limit of 1000 and an aggerate of 4 would only return 2000 (max points) / 4 (aggregation size) = 500 total points + current one so 501. [ Min - 1] [ Max - 2000] [ Default - **30**]
7. **all_data *boolean***
Returns all data (only available on histo day) [ Default - **false**]
8. **to_ts *timestamp***
Returns historical data before that timestamp. If you want to get all the available historical data, you can use limit=2000 and keep going back in time using the toTs param. You can then keep requesting batches using: &limit=2000&toTs={the earliest timestamp received}
9. **explain_path *boolean***
If set to true, each point calculated will return the available options it used to make the calculation path decision. This is intended for calculation verification purposes, please note that manually recalculating the returned data point values from this data may not match exactly, this is due to levels of caching in some circumstances. [ Default - **false**]
10. **extra_params *string***
The name of your application (we recommend you send it) [ Min length - 1] [ Max length - 2000] [ Default - **NotAvailable**]
11. **sign *boolean***
If set to true, the server will sign the requests (by default we don't sign them), this is useful for usage in smart contracts [ Default - **false**]

To get the data, you need to call the method:
```ruby
response = client.daily_pair_ohlcv(fsym: "BTC", tsym: "USD", options: { limit: 1 })
```

##### hourly_pair_ohlcv
Get open, high, low, close, volumefrom and volumeto from the hourly historical data. If e=CCCAGG and tryConversion=true, it attempts conversion through BTC or ETH to determine the best possible path. The conversion type and symbol used are appended per historical point. If you want to get all the available historical data, you can use limit=2000 and keep going back in time using the toTs parameter. You can then keep requesting batches using: &limit=2000&toTs={the earliest timestamp received}.

###### Params
* **fsym *string* Required**
The cryptocurrency symbol of interest [ Min length - 1] [ Max length - 30]
* **tsym *array by string* Required**
The currency symbol to convert into [ Min length - 1] [ Max length - 30]

###### Options
1. **try_conversion *boolean***
If set to false, it will try to get only direct trading values. This parameter is only valid for e=CCCAGG value [ Default - **true**]
2. **relaxed_validation *boolean***
Setting this to true will make sure you don't get an error on non trading pairs, they will just be filtered out of the response. [ Default - **true**]
3. **e *string***
The exchange to obtain data from [ Min length - 2] [ Max length - 30] [ Default - **cccagg_or_exchange**]
4. **aggregate *int***
Time period to aggregate the data over (for daily it's days, for hourly it's hours and for minute histo it's minutes) [ Min - 1] [ Max - 30] [ **Default** - 1]
5. **aggregate_predictable_time_periods *boolean***
Only used when the aggregate param is also in use. If false it will aggregate based on the current time.If the param is false and the time you make the call is 1pm - 2pm, with aggregate 2, it will create the time slots: ... 9am, 11am, 1pm.If the param is false and the time you make the call is 2pm - 3pm, with aggregate 2, it will create the time slots: ... 10am, 12am, 2pm.If the param is true (default) and the time you make the call is 1pm - 2pm, with aggregate 2, it will create the time slots: ... 8am, 10am, 12pm.If the param is true (default) and the time you make the call is 2pm - 3pm, with aggregate 2, it will create the time slots: ... 10am, 12am, 2pm. [ Default - **true**]
6. **limit *int***
The number of data points to return. If limit * aggregate > 2000 we reduce the limit param on our side. So a limit of 1000 and an aggerate of 4 would only return 2000 (max points) / 4 (aggregation size) = 500 total points + current one so 501. [ Min - 1] [ Max - 2000] [ Default - **30**]
7. **to_ts *timestamp***
Returns historical data before that timestamp. If you want to get all the available historical data, you can use limit=2000 and keep going back in time using the toTs param. You can then keep requesting batches using: &limit=2000&toTs={the earliest timestamp received}
8. **explain_path *boolean***
If set to true, each point calculated will return the available options it used to make the calculation path decision. This is intended for calculation verification purposes, please note that manually recalculating the returned data point values from this data may not match exactly, this is due to levels of caching in some circumstances. [ Default - **false**]
9. **extra_params *string***
The name of your application (we recommend you send it) [ Min length - 1] [ Max length - 2000] [ Default - **NotAvailable**]
10. **sign *boolean***
If set to true, the server will sign the requests (by default we don't sign them), this is useful for usage in smart contracts [ Default - **false**]

To get the data, you need to call the method:
```ruby
response = client.hourly_pair_ohlcv(fsym: "BTC", tsym: "USD", options: { limit: 1 })
```


## Middleware
Gem use a faraday for http request, you can set middleaware, example:
```ruby
response = client.single_symbol_price(fsym: "BTC", tsyms: ["ETH", "USD"]) do |f|
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
