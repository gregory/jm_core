require 'virtus'
require 'wisper'
require 'securerandom'

module Jm
  module Domain
    module Entity
      def self.included(klass)
        klass.send(:include, Wisper::Publisher)
        klass.send(:include, Virtus.model)
      end

      def apply(*params)
        event, options = *params
        send(event, options)
        publish(event, options)
        self
      end

      def replay(*events)
        events.each{ |event| event_name, options = event; send(event_name, options) }
      end

      private

      def new_uuid
        SecureRandom.uuid
      end
    end
  end
end
