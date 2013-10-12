require 'spec_helper'

describe MAVLink::Log::Messages::SysStatus do

  let(:time) { ["0004D9EE5A9C7690"].pack('H*') }

  let(:header) { MAVLink::Log::Header.new(["FE09F7370100"].pack('H*')) }

  let(:payload) { ["2FFCFFFF2FACFFFF2FFCFFFF0000112BFFFF000000000000000000000000FF"].pack('H*') }

  let(:crc) { ["E3E0"].pack('H*') }

  subject do
    entry = MAVLink::Log::Entry.new(time, header, payload, crc)
    MAVLink::Log::Messages::SysStatus.new(entry)
  end

  it_behaves_like 'a message'

  its(:onboard_control_sensors_present) { should eql(0xFFFFFC2F) }

  its(:onboard_control_sensors_enabled) { should eql(0xFFFFAC2F) }

  its(:onboard_control_sensors_health) { should eql(0xFFFFFC2F) }

  its(:load) { should be_within(0.001).of(0.0) }

  its(:voltage_battery) { should be_within(0.01).of(11.025) }

  its(:current_battery) { should be_within(0.01).of(-0.01) }

  its(:battery_remaining) { should eql(0) }

  its(:drop_rate_comm) { should eql(0) }

  its(:errors_comm) { should eql(0) }

  its(:errors_count1) { should eql(0) }

  its(:errors_count2) { should eql(0) }

  its(:errors_count3) { should eql(0) }

  its(:errors_count4) { should eql(65280) }

end
