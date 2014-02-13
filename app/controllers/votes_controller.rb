class VotesController < ApplicationController
  def create
    @poll = Poll.find_securely(params[:poll_id])
    option = @poll.options.where(id: vote_params[:option_id]).first
    vote = Vote.new(option: option)
    
    vote.save
    redirect_to @poll
  end

private

  def vote_params
    params.require(:vote).permit(:option_id)
  end
end