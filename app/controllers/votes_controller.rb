class VotesController < ApplicationController
  def create
    poll = Poll.find_securely(params[:poll_id])
    option = poll.options.where(id: vote_params[:option_id]).first
    Vote.create(option: option, user_hash: current_user_hash_for_poll(poll))
    
    redirect_to poll
  end
  
  def update
    poll = Poll.find_securely(params[:poll_id])
    option = poll.options.where(id: vote_params[:option_id]).first
    vote = poll.votes.where(user_hash: current_user_hash_for_poll(poll)).first
    
    vote.update(option: option)
    
    redirect_to poll
  end

private

  def vote_params
    params.require(:vote).permit(:option_id)
  end
end