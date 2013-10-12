require 'spec_helper'

describe MAVLink::Log::Messages::GpsRawInt do

  let(:time) { ["0004d9ee608d5a08"].pack('H*') }

  let(:header) { MAVLink::Log::Header.new(["FE1E9C370118"].pack('H*')) }

  let(:payload) { ["a091a127000000003066b11751535bc1959402000800ffff0500232d0305"].pack('H*') }

  let(:crc) { ["c13a"].pack('H*') }

  subject do
    entry = MAVLink::Log::Entry.new(time, header, payload, crc)
    MAVLink::Log::Messages::GpsRawInt.new(entry)
  end

  it_behaves_like 'a message'

  it_behaves_like 'a timed message (us)', 664900000

  its(:fix_type) { should eql(3) }

  its(:lat) { should be_within(0.0001).of(39.7502) }

  its(:lon) { should be_within(0.0001).of(-105.0979) }

  its(:alt) { should be_within(0.01).of(169.11) }

  its(:eph) { should be_within(0.01).of(0.08) }

  its(:epv) { should be_within(0.01).of(655.35) }

  its(:vel) { should be_within(0.01).of(0.05) }

  its(:cog) { should be_within(0.01).of(115.55) }

  its(:satellites_visible) { should eql(5) }

end
