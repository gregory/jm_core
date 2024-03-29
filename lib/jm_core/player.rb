module JmCore
  class Player
    include Domain::Entity
    EVENTS={
      created: :player_created
    }

    attribute :uuid, String
    attribute :name, String
    attribute :nick, String

    def create
      apply :player_created, {uuid: new_uuid}
    end

    private

    def player_created(event)
      self.uuid = event[:uuid]
    end
  end
end
