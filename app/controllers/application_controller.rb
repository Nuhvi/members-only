# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def log_in(user)
    session[:user_id] = user.id
    user.create_new_token
    cookies.permanent[:remember_token] = user.remember_digest
  end

  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(user_id)  
    elsif (remember_token = cookies[:remember_token])
      user = User.find_by(remember_token)
      log_in(user)
      @current_user = user
    end
  end

  def signout
    @current_user = nil
    session[:user_id] = nil
    cookies.permanent[:remember_token] = nil
  end
end
