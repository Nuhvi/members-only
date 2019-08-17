# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user&.authenticate(params[:session][:password])
      log_in(@user)
      redirect_to root_url
    else
      flash.now[:danger] = 'Please try again'
      render 'new'
    end
  end

  def destroy
    signout
    redirect_to root_url
  end
end
