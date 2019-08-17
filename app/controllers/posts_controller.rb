# frozen_string_literal: true

class PostsController < ApplicationController
  # before_action :signed_in?, only: [:new, :create]
  def index
    @posts = Post.all
  end

  def new
    if logged_in?
      @post = Post.new
    else
      flash[:danger] = 'Please sign in first.'
      redirect_to login_path
    end
  end

  def create
    if (user = current_user)
      post = user.posts.build(post_params)
      if post.save
        flash[:success] = 'post saved successfully.'
        redirect_to root_url
      else
        render :new
      end
    else
      flash[:danger] = 'Please sign in first.'
      redirect_to login_path
    end
  end

  private

  def signed_in?
    current_user
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
