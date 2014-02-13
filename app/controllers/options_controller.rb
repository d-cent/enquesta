class OptionsController < ApplicationController
  def create
    @poll = Poll.find_securely(params[:poll_id])
    option = @poll.options.new(option_params)
    
    option.save
    redirect_to @poll
  end

private

  def option_params
    params.require(:option).permit(:text)
  end
end
