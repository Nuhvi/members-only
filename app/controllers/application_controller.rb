# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include ApplicationHelper
  def signout
    @current_user = nil
    session[:user_id] = nil
    cookies.permanent[:remember_token] = nil
  end
end
