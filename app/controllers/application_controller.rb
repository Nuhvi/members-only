# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def log_in(user)
    session[:user_id] = user.id
    user.create_new_token
    cookies.permanent[:remember_token] = user.remember_digest
  end
end
