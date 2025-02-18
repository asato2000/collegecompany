class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  
  
  
  def show
    
    @fav_posts = @user.fav_posts.page(params[:page])
    @posts = @user.posts.page(params[:page])
    @bought_items = current_user.bought_items.page(params[:page])
  end  
  

private
  
 
  
  
  def set_user
    @user = User.find(params[:id])
  end  

end
