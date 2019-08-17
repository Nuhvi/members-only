# frozen_string_literal: true

module ApplicationHelper
  def logged_in?
    !current_user.nil?
  end

  def log_in(user)
    session[:user_id] = user.id
    user.create_new_token
    cookies.permanent[:remember_token] = user.remember_digest
  end

  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (remember_token = cookies[:remember_token])
      user = User.find_by(remember_token: remember_token)
      log_in(user) if user
      @current_user = user
    end
  end
end
