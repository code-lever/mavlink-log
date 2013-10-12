require 'spec_helper'

describe MAVLink::Log::File do

  describe '#new' do

    context 'with data file delete-me-soon.tlog' do

      before(:all) { @file = MAVLink::Log::File.new(data_file('delete-me-soon.tlog')) }

      subject { @file }

      its(:duration) { should be_within(0.1).of(99.7) }

      it { should have(21138).entries }

      it { should have(21138).messages }

      its(:to_kml?) { should be_true }

    end

    it 'should raise for invalid or missing files' do
      files = invalid_data_files
      files.should have(6).files

      files.each do |f|
        expect { MAVLink::Log::File.new(f) }.to raise_error
      end
    end

  end

end
