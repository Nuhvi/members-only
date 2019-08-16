# frozen_string_literal: true

class PostsController < ApplicationController
  #before_action :signed_in?, only: [:new, :create]
  def index
    @posts = Post.all 
  end

  def new
    @post = Post.new
  end

  def create
    post = current_user.posts.build(post_params)
    if post.save
      redirect_to root_url
    else 
      p "error creating post"
      render :new
    end
  end
  private
  def signed_in?
    current_user
  end
  def post_params
    params.require(:post).permit(:title,:content)
  end
end
