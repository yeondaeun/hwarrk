class HomeController < ApplicationController
  before_action :authenticate_user!
  
  def index
    
    @posts = Post.all
  end

  def new
  end

  def create
    @post= Post.new
    @post.user_id= current_user.id
    @post.col_title = params[:bo_title]
    @post.col_content = params[:bo_content]
    @post.image = params[:image]
    
    @post.save
    
    redirect_to '/home/index'
    
    
  end
  
  def ranking
    @users = User.all
    @user_post_count={}
    @user_email={}
    @users.each do |aa|
      count = Post.where(user_id: aa.id).count
      @user_post_count[aa.id]=count
      @user_email[aa.id]=User.find(aa.id).email
      
    end
    @user_post_count=@user_post_count.sort_by {|_key, value| value}.reverse.to_h
    @x=@user_post_count.keys
  end
  
  def destroy
    post = Post.find(params[:post_id])
    post.destroy
    redirect_to '/home/index'
  end
  
  def edit
    @post = Post.find(params[:post_id])
  end
  
  def update
    
    post = Post.find(params[:post_id])
    post.col_title = params[:bo_title]
    post.col_content = params[:bo_content]
    post.image = params[:image]
    post.save
    
    redirect_to '/home/index'
    
  end
end
