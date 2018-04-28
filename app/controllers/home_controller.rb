class HomeController < ApplicationController
  def index
    
    @posts = Post.all
  end

  def new
  end

  def create
    @post= Post.new
    @post.col_title = params[:bo_title]
    @post.col_content = params[:bo_content]
    
    @post.save
    
    redirect_to '/home/index'
    
    
  end
end
