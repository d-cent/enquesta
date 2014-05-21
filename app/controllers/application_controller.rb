class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

private
  
  def current_user_hash_for_poll(poll)
    Digest::MD5.hexdigest(
      [poll.id.to_s, request.remote_ip,
      request.env['HTTP_USER_AGENT'],
      request.env['HTTP_ACCEPT']]
      .reject { |c| c.nil? }.sort.join('')
    )
  end
end
