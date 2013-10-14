require 'spec_helper'

describe MAVLink::Log::Messages::MissionRequest do

  let(:time) { ["0004E8A7C0EAD571"].pack('H*') }

  let(:header) { MAVLink::Log::Header.new(["FE0449FFBE28"].pack('H*')) }

  let(:payload) { ["00000101"].pack('H*') }

  let(:crc) { ["14B9"].pack('H*') }

  subject do
    entry = MAVLink::Log::Entry.new(time, header, payload, crc)
    MAVLink::Log::Messages::MissionRequest.new(entry)
  end

  it_behaves_like 'a message'

  its(:seq) { should eql(0) }

  its(:target_system) { should eql(1) }

  its(:target_component) { should eql(1) }

end
