require 'spec_helper'

shared_examples 'a timed message (us)' do |time|

  it { should respond_to(:time_usec) }

  its(:time_usec) { should eql(time) }

end
