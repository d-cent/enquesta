require 'spec_helper'

describe PollsController do
  describe "GET #show" do
    it "assigns the obfuscated poll to @poll" do
      poll = Poll.create!(prompt: 'Where should we have dinner?')
      get :show, id: poll
      assigns(:poll).should eq(poll)
    end
  end
end
