require "zeitwerk"
require "faraday"
require "debug"

require_relative "cryptocompare/version"
require_relative "cryptocompare/utils/string"
require_relative "cryptocompare/utils/hash"

loader = Zeitwerk::Loader.for_gem
loader.setup

module Cryptocompare
  class Error < StandardError; end
end
