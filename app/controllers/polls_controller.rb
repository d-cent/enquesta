class PollsController < ApplicationController
  def show
    @poll = Poll.find_securely(params[:id])
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