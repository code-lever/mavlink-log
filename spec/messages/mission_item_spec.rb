require 'spec_helper'

describe MAVLink::Log::Messages::MissionItem do

  let(:time) { ["0004E8A67D4E5686"].pack('H*') }

  let(:header) { MAVLink::Log::Header.new(["FE25BB010127"].pack('H*')) }

  let(:payload) { ["0000000000000000000000000000000016BE24425C05C0C20000000000001000FFBE000101"].pack('H*') }

  let(:crc) { ["9E5A"].pack('H*') }

  subject do
    entry = MAVLink::Log::Entry.new(time, header, payload, crc)
    MAVLink::Log::Messages::MissionItem.new(entry)
  end

  it_behaves_like 'a message'

  its(:param1) { should be_within(0.1).of(0) }

  its(:param2) { should be_within(0.1).of(0) }

  its(:param3) { should be_within(0.1).of(0) }

  its(:param4) { should be_within(0.1).of(0) }

  its(:x) { should be_within(0.00001).of(41.18563) }

  its(:y) { should be_within(0.00001).of(-96.01047) }

  its(:z) { should be_within(0.1).of(0) }

  its(:seq) { should eql(0) }

  its(:command) { should eql(16) }

  its(:target_system) { should eql(255) }

  its(:target_component) { should eql(190) }

  its(:frame) { should eql(0) }

  its(:current) { should be(true) }

  its(:autocontinue) { should be(true) }

end
