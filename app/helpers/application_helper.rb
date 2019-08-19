# frozen_string_literal: true

module ApplicationHelper
  def logged_in?
    !current_user.nil?
  end

  def log_in(user)
    session[:user_id] = user.id
    user.remember
    cookies.permanent[:remember_token] = user.remember_token
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

  def logout
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end

  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end
end
