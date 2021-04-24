class PostsController < ApplicationController
   before_action :authenticate_user!, only: [:new,:create,:edit,:update,:destroy]
   before_action :find_post, only: [:show, :edit, :update, :destroy, :purchase, :buy,:done] 
   before_action :correct_user, only: [:destroy,:edit]
   
    require "payjp"
       
  def index
    @posts =  Post.order(id: :desc).page(params[:page]).per(8)
  end

  def show
    
  end

  def new
    @post = Post.new
    
  end

  def create
        @post = current_user.posts.build(post_params)
        if @post.save
            flash[:success] = "正常に投稿されました！"
            redirect_to posts_path
        else
            flash.now[:danger] = "正常に投稿できませんでした。"
            render :new
        end    
  end
    
  def edit
    
  end

  def update
   if @post.update(post_params)
      flash[:success] = 'ノートは正常に更新されました'
      redirect_to root_path
   else
      flash.now[:danger] = 'ノートは更新されませんでした'
      render :edit
   end
  end

  def destroy
    @post.destroy
    flash[:success] = 'メッセージを削除しました。'
    redirect_to root_path
    
  end
 
    
  def purchase
    # card = Card.where(user_id: current_user.id).first
    # if card.blank?
    #   redirect_to controller: "cards", action: "new"
    # else
    #   Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    #   customer = Payjp::Customer.retrieve(card.customer_id)
    #   @card = customer.cards.retrieve(card.card_id)
    # end 
  end  


  
  def buy
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @post.price, 
      card: params['payjp-token'], 
      currency: 'jpy'
    )
    @post.save
    redirect_to action: "done"
    
    
  def done
  end  
  
  end   
  
  private
  
  def post_params
    params.require(:post).permit(:content,:title,:teacher_name,:subject,:post_image,:note,:price)
  end  
  
  def find_post
     @post = Post.find(params[:id])
  end
  
  
  def correct_user
    @post = current_user.posts.find_by(id: params[:id])
      unless @post
         redirect_to new_user_session_path
      end
  end    
    
  
  
end 
