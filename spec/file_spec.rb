require 'spec_helper'

describe MAVLink::Log::File do

  describe '#new' do

    context 'with data file 2013-10-13 16-58-51.tlog' do

      before(:all) { @file = MAVLink::Log::File.new(data_file('2013-10-13 16-58-51.tlog')) }

      subject { @file }

      its(:duration) { should be_within(0.1).of(570.8) }

      its(:started_at) { should be_within(0.0001).of(1381701533.3125) }

      its(:ended_at) { should be_within(0.0001).of(1381702104.1094) }

      it { should have(16187).entries }

      it { should have(16187).messages }

    end

    context 'with data file 2013-10-13 18-31-24.tlog' do

      before(:all) { @file = MAVLink::Log::File.new(data_file('2013-10-13 18-31-24.tlog')) }

      subject { @file }

      its(:duration) { should be_within(0.1).of(1113.8) }

      its(:started_at) { should be_within(0.0001).of(1381707086.4375) }

      its(:ended_at) { should be_within(0.0001).of(1381708200.2188) }

      it { should have(13382).entries }

      it { should have(13382).messages }

    end

    context 'with data file 2013-10-13 18-50-10.tlog' do

      before(:all) { @file = MAVLink::Log::File.new(data_file('2013-10-13 18-50-10.tlog')) }

      subject { @file }

      its(:duration) { should be_within(0.1).of(629.9) }

      its(:started_at) { should be_within(0.0001).of(1381708212.0313) }

      its(:ended_at) { should be_within(0.0001).of(1381708842.0) }

      it { should have(19359).entries }

      it { should have(19359).messages }

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
