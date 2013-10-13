require 'spec_helper'

describe MAVLink::Log::Messages::ParamValue do

  let(:time) { ["0004E87DCDB548F1"].pack('H*') }

  let(:header) { MAVLink::Log::Header.new(["FE192D010116"].pack('H*')) }

  let(:payload) { ["0000BA4210010F014D4F545F544352565F4D41585043540002"].pack('H*') }

  let(:crc) { ["6982"].pack('H*') }

  subject do
    entry = MAVLink::Log::Entry.new(time, header, payload, crc)
    MAVLink::Log::Messages::ParamValue.new(entry)
  end

  it_behaves_like 'a message'

  its(:param_value) { should be_within(0.01).of(93.0) }

  its(:param_count) { should eql(272) }

  its(:param_index) { should eql(271) }

  its(:param_id) { should eql('MOT_TCRV_MAXPCT') }

  its(:param_type) { should eql(2) }

end
