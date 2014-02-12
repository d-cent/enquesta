require 'spec_helper'

describe OptionsController do
  describe "POST create" do
    poll = Poll.create!(prompt: 'Where should we have dinner?')
    
    context "with valid attributes" do
      it "creates a new option" do
        expect {
          post :create, poll_id: poll, option: { text: 'Cornucopia' }
        }.to change(poll.options, :count).by(1)
      end
      it "redirects to the option's parent poll" do
        post :create, poll_id: poll, option: { text: 'Cornucopia' }
        response.should redirect_to Option.last.poll
      end
    end
    
    context "with invalid attributes" do
      it "does not create a new option" do
        expect {
          post :create, poll_id: poll, option: { text: '' }
        }.to_not change(poll.options, :count)
      end
      it "re-renders the show action" do
        post :create, poll_id: poll, option: { text: '' }
        response.should redirect_to poll
      end
    end
  end
end
