require 'spec_helper'

describe MAVLink::Log::Messages::Attitude do

  let(:time) { ["0004E87DD12586BD"].pack('H*') }

  let(:header) { MAVLink::Log::Header.new(["FE1CEB01011E"].pack('H*')) }

  let(:payload) { ["6533010081A986BB0EB69CBB2311D93F3CE3933AC0BB36BA80C911B9"].pack('H*') }

  let(:crc) { ["4D46"].pack('H*') }

  subject do
    entry = MAVLink::Log::Entry.new(time, header, payload, crc)
    MAVLink::Log::Messages::Attitude.new(entry)
  end

  it_behaves_like 'a message'

  it_behaves_like 'a timed message'

  its(:roll) { should be_within(0.01).of(0.0) }

  its(:pitch) { should be_within(0.01).of(0.0) }

  its(:yaw) { should be_within(0.01).of(0.0) }

  its(:rollspeed) { should be_within(0.01).of(1.695) }

  its(:pitchspeed) { should be_within(0.01).of(0.0) }

  its(:yawspeed) { should be_within(0.01).of(0.0) }

end
