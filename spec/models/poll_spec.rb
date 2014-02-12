require 'spec_helper'

describe Poll do
  describe "obfuscated" do
    let(:poll) { Poll.create!(prompt: 'Where should we have dinner?') }

    it "should generate an obfuscated hashed id" do
      poll.hashed_id.length.should == 40
    end

    it "should by findable by its hashed id" do
      poll.should == Poll.find_securely(poll.hashed_id)
    end
  end
end