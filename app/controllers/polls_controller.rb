class PollsController < ApplicationController
  def show
    @poll = Poll.find_securely(params[:id])
  end
  
  def new
    @poll = Poll.new
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
    params.require(:poll).permit(:prompt)
  end
end