class PollsController < ApplicationController
  def show
    @poll = Poll.find_securely(params[:id])
    
    user_hash = Digest::MD5.hexdigest(
                  [@poll.id.to_s, request.remote_ip,
                  request.env['HTTP_USER_AGENT'],
                  request.env['HTTP_ACCEPT']]
                  .reject { |c| c.nil? }.sort.join('')
                )
    
    @vote = @poll.votes.where(user_hash: user_hash).first || Vote.new
  end
  
  def new
    @poll = Poll.new(ends_at: Time.zone.now + 1.hours)
    
    3.times { @poll.options.build }
  end
  
  def create
    @poll = Poll.new(poll_params)
    if @poll.save
      redirect_to @poll
    else
      render :new
    end
  end
  
private

  def poll_params
    params.require(:poll).permit(:prompt, :ends_at, options_attributes: [:id, :text])
  end
end