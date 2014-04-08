require 'digest/md5'

class VotesController < ApplicationController
  def create
    @poll = Poll.find_securely(params[:poll_id])
    option = @poll.options.where(id: vote_params[:option_id]).first
    user_hash_components = [params[:poll_id], request.env['REMOTE_ADDR'], request.env['HTTP_USER_AGENT'], request.env['HTTP_ACCEPT']].sort.reject { |c| c.nil? }.join('')
    user_hash = Digest::MD5.hexdigest(user_hash_components)
    vote = Vote.new(option: option, user_hash: user_hash)
    
    vote.save
    redirect_to @poll
  end

private

  def vote_params
    params.require(:vote).permit(:option_id)
  end
end