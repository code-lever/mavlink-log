require 'spec_helper'

shared_examples 'a timed message (us)' do

  it { should respond_to(:time_usec) }

  its(:time_usec) { should_not be_nil }

end
