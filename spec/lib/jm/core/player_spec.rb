require 'spec_helper'

describe Jm::Core::Player do
  describe '#create' do
    let(:params){ { name: 'foo', nick: 'bar' } }
    let(:listener){ double(:listener) }
    let(:player){ described_class.new(params) }
    let(:uuid){ 'foo' }

    subject{ player.create }

    before do
      player.stub(:new_uuid).and_return(uuid)
      player.subscribe(listener)
    end

    it 'publish a player_created event with the created event' do
      listener.should_receive(:player_created).with({ uuid: uuid })
      subject
    end

    it 'assign a uuid to player' do
      subject.uuid.should eq uuid
    end
  end
end
