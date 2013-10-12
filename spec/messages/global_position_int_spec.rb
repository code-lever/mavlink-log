require 'spec_helper'

describe MAVLink::Log::Messages::GlobalPositionInt do

  let(:time) { ["0004D9EE608DF2D4"].pack('H*') }

  let(:header) { MAVLink::Log::Header.new(["FE1CA7370121"].pack('H*')) }

  let(:payload) { ["0C260A00E065B117B3535BC140D31900C0E0FFFFF2FF0F00EEFF3C8C"].pack('H*') }

  let(:crc) { ["FD73"].pack('H*') }

  subject do
    entry = MAVLink::Log::Entry.new(time, header, payload, crc)
    MAVLink::Log::Messages::GlobalPositionInt.new(entry)
  end

  it_behaves_like 'a message'

  it_behaves_like 'a timed message (ms)', 665100

  its(:lat) { should be_within(0.0001).of(39.7501) }

  its(:lon) { should be_within(0.0001).of(-105.0979) }

  its(:alt) { should be_within(0.01).of(1692.48) }

  its(:relative_alt) { should be_within(0.01).of(-8.0) }

  its(:vx) { should be_within(0.01).of(-0.14) }

  its(:vy) { should be_within(0.01).of(0.15) }

  its(:vz) { should be_within(0.01).of(-0.18) }

  its(:hdg) { should be_within(0.1).of(359.0) }

end
