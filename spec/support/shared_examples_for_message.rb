require 'spec_helper'

shared_examples 'a message' do

  it { should respond_to(:id) }

  its(:id) { should_not be_nil }

  it { should respond_to(:crc) }

  its(:crc) { should_not be_nil }

end
