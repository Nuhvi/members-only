# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :signed_in?, only: %i[new create]
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    return unless (user = current_user)

    post = user.posts.build(post_params)
    if post.save
      flash[:success] = 'post saved successfully.'
      redirect_to root_url
    else
      flash[:danger] = 'Pleas enter valid post details'
      redirect_to new_post_path
    end
  end

  private

  def signed_in?
    flash[:danger] = 'Please log in first.' unless logged_in?
    redirect_to login_pathunless logged_in?
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
