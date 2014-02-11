require "jm/core/version"
require 'virtus'
require 'wisper'

Dir.glob(File.join(File.dirname(__FILE__) + '/core/**.rb'), &method(:require))

module Jm
  module Core
    # Your code goes here...
  end
end
