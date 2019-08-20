# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include ApplicationHelper

  def log_in(user)
    session[:user_id] = user.id
    user.remember
    cookies.permanent[:remember_token] = user.remember_token
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
