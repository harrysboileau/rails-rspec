class PostsController < ApplicationController
  before_filter :must_be_logged_in

  def index
    User.authenticate self.email, self.encrypted_password
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

end


