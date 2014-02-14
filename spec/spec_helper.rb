require 'rubygems'
require 'bundler/setup'
Bundler.require(:default, :test)

$LOAD_PATH <<  File.dirname(__FILE__)
require_relative '../lib/jm_core'

RSpec.configure do |config|

end
