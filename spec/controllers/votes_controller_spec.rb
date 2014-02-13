require 'spec_helper'

describe VotesController do
  describe "POST create" do
    poll = Poll.create(prompt: 'Where should we meet?')
    poll.options << Option.create(text: 'The Park')
    poll.options << Option.create(text: 'The Pub')
    
    context "with valid attributes" do
      it "creates a new vote" do
        expect {
          post :create, poll_id: poll, vote: { option_id: poll.options.last.id }
        }.to change(Vote, :count).by(1)
      end
      it "redirects to the poll" do
        post :create, poll_id: poll, vote: { option_id: poll.options.last.id }
        response.should redirect_to poll
      end
    end
    
    context "with invalid attributes" do
      it "does not create a new vote" do
        expect {
          post :create, poll_id: poll, vote: { option_id: (poll.options.last.id + 1) }
        }.to_not change(Vote, :count)
      end
      it "redirects to the poll" do
        post :create, poll_id: poll, vote: { option_id: (poll.options.last.id + 1) }
        response.should redirect_to poll
      end
    end
  end
end