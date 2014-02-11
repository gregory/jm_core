module Jm
  module Core
    class Player
      include Virtus.model
      include Wisper::Publisher

      attribute :uuid, String
      attribute :name, String
      attribute :nick, String

      def self.create(params)
        player = self.new
        params = params.merge(uuid: new_uuid)

        player.player_created params
        player.send(:publish, :player_created, params)

        player
      end

      def player_created(event)
        self.attributes = event
      end

      private

      def self.new_uuid
        SecureRandom.uuid
      end
    end
  end
end
