require 'spec_helper'

describe MAVLink::Log::File do

  describe '#new' do

    context 'with data file delete-me-soon.tlog' do

      before(:all) { @file = MAVLink::Log::File.new(data_file('delete-me-soon.tlog')) }

      subject { @file }

      it 'should have a duration'

    end

  end

end
