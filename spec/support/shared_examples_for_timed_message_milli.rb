require 'spec_helper'

shared_examples 'a timed message (ms)' do |time|

  it { should respond_to(:time_boot_ms) }

  its(:time_boot_ms) { should eql(time) }

end
