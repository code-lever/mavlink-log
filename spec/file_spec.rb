require 'spec_helper'

describe MAVLink::Log::File do

  describe '#new' do

    context 'with data file delete-me-soon.tlog' do

      before(:all) { @file = MAVLink::Log::File.new(data_file('delete-me-soon.tlog')) }

      subject { @file }

      its(:duration) { should be_within(0.1).of(99.7) }

      it { should have(21138).entries }

      its(:to_kml?) { should be_true }

    end

  end

end
