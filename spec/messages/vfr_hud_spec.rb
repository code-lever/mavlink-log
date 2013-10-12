require 'spec_helper'

describe MAVLink::Log::Messages::VfrHud do

  let(:time) { ["0004d9ee608dc804"].pack('H*') }

  let(:header) { MAVLink::Log::Header.new(["FE14A437014A"].pack('H*')) }

  let(:payload) { ["713d8a3e8fc2753d5c8fd344000090c167010000"].pack('H*') }

  let(:crc) { ["8C40"].pack('H*') }

  subject do
    entry = MAVLink::Log::Entry.new(time, header, payload, crc)
    MAVLink::Log::Messages::VfrHud.new(entry)
  end

  it_behaves_like 'a message'

  its(:airspeed) { should be_within(0.01).of(0.27) }

  its(:groundspeed) { should be_within(0.01).of(0.06) }

  its(:heading) { should eql(-28836) }

  its(:throttle) { should eql(17619) }

  its(:alt) { should be_within(0.1).of(-18.0) }

  its(:climb) { should be_within(0.1).of(0.0) }

end
