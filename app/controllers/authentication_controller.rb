class AuthenticationController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :current_user
  
  def current_user
    return unless session[:member_id]
    @current_user ||= Member.find(session[:member_id])
  end

end
