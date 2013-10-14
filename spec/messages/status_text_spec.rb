require 'spec_helper'

describe MAVLink::Log::Messages::StatusText do

  let(:time) { ["0004E8A824FF4B55"].pack('H*') }

  let(:header) { MAVLink::Log::Header.new(["FE331C0101FD"].pack('H*')) }

  let(:payload) { ["01496E697469616C6973696E672041504D2E2E2E00000000000000000000000000000000000000000000000000000000000000"].pack('H*') }

  let(:crc) { ["BD5C"].pack('H*') }

  subject do
    entry = MAVLink::Log::Entry.new(time, header, payload, crc)
    MAVLink::Log::Messages::StatusText.new(entry)
  end

  it_behaves_like 'a message'

  its(:severity) { should eql(1) }

  its(:text) { should eql('Initialising APM...') }

end
