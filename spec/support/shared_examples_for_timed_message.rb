require 'spec_helper'

shared_examples 'a timed message' do

  it { should respond_to(:time_boot_ms) }

  its(:time_boot_ms) { should_not be_nil }

end
