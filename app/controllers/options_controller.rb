class OptionsController < ApplicationController
  def create
    @poll = Poll.find_securely(params[:poll_id])
    option = @poll.options.new(option_params)
    if option.save
      redirect_to @poll
    else
      redirect_to @poll
    end
  end

private

  def option_params
    params.require(:option).permit(:text)
  end
end
