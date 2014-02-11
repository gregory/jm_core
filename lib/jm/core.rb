require_relative 'domain'
Dir[File.dirname(__FILE__) + '/core/**/*.rb'].each{ |file| require_relative file }

module Jm
  module Core
    # Your code goes here...
  end
end
