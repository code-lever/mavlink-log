require 'spec_helper'

describe MAVLink::Log::Messages::HeartBeat do

  let(:time) { ["0004D9EE608AD128"].pack('H*') }

  let(:header) { MAVLink::Log::Header.new(["FE09F7370100"].pack('H*')) }

  let(:payload) { ["01000000010AC10403"].pack('H*') }

  let(:crc) { ["F8CE"].pack('H*') }

  subject do
    entry = MAVLink::Log::Entry.new(time, header, payload, crc)
    MAVLink::Log::Messages::HeartBeat.new(entry)
  end

  it_behaves_like 'a message'

  its(:type) { should eql(1) }

  its(:autopilot) { should eql(0) }

  its(:base_mode) { should eql(0) }

  its(:custom_mode) { should eql(0xC10A0100) }

  its(:system_status) { should eql(4) }

  its(:mavlink_version) { should eql(3) }

end
