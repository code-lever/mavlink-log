require 'spec_helper'

describe MAVLink::Log::Messages::RcChannelsRaw do

  let(:time) { ["0004E87DD1249299"].pack('H*') }

  let(:header) { MAVLink::Log::Header.new(["FE16E5010123"].pack('H*')) }

  let(:payload) { ["BA320100EE05F5054A04FA058207D905d905d9050000"].pack('H*') }

  let(:crc) { ["71CD"].pack('H*') }

  subject do
    entry = MAVLink::Log::Entry.new(time, header, payload, crc)
    MAVLink::Log::Messages::RcChannelsRaw.new(entry)
  end

  it_behaves_like 'a message'

  it_behaves_like 'a timed message (ms)', 78522

  its(:port) { should eql(0) }

  its(:chan1_raw) { should eql(1518) }

  its(:chan2_raw) { should eql(1525) }

  its(:chan3_raw) { should eql(1098) }

  its(:chan4_raw) { should eql(1530) }

  its(:chan5_raw) { should eql(1922) }

  its(:chan6_raw) { should eql(1497) }

  its(:chan7_raw) { should eql(1497) }

  its(:chan8_raw) { should eql(1497) }

  its(:rssi) { should eql(0) }

end
