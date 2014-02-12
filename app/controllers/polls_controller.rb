class PollsController < ApplicationController
  def show
    @poll = Poll.find_securely(params[:id])
  end
end