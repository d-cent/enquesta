require 'spec_helper'

describe Poll do
  describe "obfuscated" do
    let(:poll) { Poll.create!(prompt: 'Where should we have dinner?', ends_at: (Time.zone.now + 5.hours)) }

    it "should generate an obfuscated hashed id" do
      poll.hashed_id.length.should == 40
    end

    it "should by findable by its hashed id" do
      poll.should == Poll.find_securely(poll.hashed_id)
    end
  end
  
  describe "voting" do
    let(:poll) do
      Poll.create!(prompt: 'What should we eat?',
                   ends_at: (Time.zone.now + 5.hours),
                   options_attributes: [{text: "Falafel"}, {text: "Halloumi"}, {text: "Spinach"}])
    end

    it "should refer to its most voted option as its winner" do
      5.times { poll.options.where(text: 'Falafel').first.votes.create! }
      4.times { poll.options.where(text: 'Halloumi').first.votes.create! }
      3.times { poll.options.where(text: 'Spinach').first.votes.create! }
      
      poll.winning_option.text.should == 'Falafel'
    end
  end
end