require "zeitwerk"
loader = Zeitwerk::Loader.for_gem
loader.setup

require_relative "cryptocompare/version"

module Cryptocompare
  class Error < StandardError; end
end
