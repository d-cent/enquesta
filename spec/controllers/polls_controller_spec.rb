require 'spec_helper'

describe PollsController do
  describe "GET #show" do
    it "assigns the obfuscated poll to @poll" do
      poll = Poll.create!(prompt: 'Where should we have dinner?')
      get :show, id: poll
      assigns(:poll).should eq(poll)
    end
  end
  
  describe "GET #new" do
    it "assigns a new poll to @poll" do
      get :new
    end
  end
  
  describe "POST create" do
    context "with valid attributes" do
      it "creates a new poll" do
        expect {
          post :create, poll: { prompt: 'Where should we have dinner?' }
        }.to change(Poll, :count).by(1)
      end
      it "redirects to the new poll" do
        post :create, poll: { prompt: 'Where should we have dinner?' }
        response.should redirect_to Poll.last
      end
    end
    
    context "with invalid attributes" do
      it "does not create a new poll" do
        expect {
          post :create, poll: { prompt: '' }
        }.to_not change(Poll, :count)
      end
      it "re-renders the new action" do
        post :create, poll: { prompt: '' }
        response.should render_template :new
      end
    end
  end
end