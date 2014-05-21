class VotesController < ApplicationController
  def create
    poll = Poll.find_securely(params[:poll_id])
    option = poll.options.where(id: vote_params[:option_id]).first
    
    user_hash = Digest::MD5.hexdigest(
                  [poll.id.to_s, request.remote_ip,
                  request.env['HTTP_USER_AGENT'],
                  request.env['HTTP_ACCEPT']]
                  .reject { |c| c.nil? }.sort.join('')
                )
    
    vote = Vote.new(option: option, user_hash: user_hash)
    
    vote.save
    redirect_to poll
  end
  
  def update
    poll = Poll.find_securely(params[:poll_id])
    option = poll.options.where(id: vote_params[:option_id]).first
    
    user_hash = Digest::MD5.hexdigest(
                  [poll.id.to_s, request.remote_ip,
                  request.env['HTTP_USER_AGENT'],
                  request.env['HTTP_ACCEPT']]
                  .reject { |c| c.nil? }.sort.join('')
                )
  
    vote = poll.votes.where(user_hash: user_hash).first
    
    vote.update(option: option)
    
    redirect_to poll
  end

private

  def vote_params
    params.require(:vote).permit(:option_id)
  end
end