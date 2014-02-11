require 'spec_helper'

describe Jm::Domain::Entity do
  it{ should be_kind_of Module}

  context 'when included' do
    let(:host_class) do
      Class.new do |klass|
        klass.send(:include, Jm::Domain::Entity)
      end
    end
    let(:listener){ double(:listener) }
    let(:event){ :foo }
    let(:params){ [{ foo: 'bar' }, 'a'] }

    subject{ host_class.new }
    before{ subject.subscribe(listener) }

    it 'can apply events' do
      subject.respond_to?(:apply).should be_true
      listener.should_receive(event).with(params)
      subject.should_receive(event).with(params).and_return(subject)
      subject.apply(event, params)
    end

    it 'can replay events' do
      subject.respond_to?(:replay).should be_true
      subject.should_receive(event).with(params).twice
      subject.replay([event, params], [event, params])
    end
  end
end
