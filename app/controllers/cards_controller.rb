class CardsController < ApplicationController
    require 'payjp' 

#   def new
    
#     card = Card.new
#   end
  
#   def pay
#   Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
#   if params['payjp-token'].blank?
#     redirect_to action: "new",alert: "クレジットカードは登録できませんでした。"
#   else
#     customer = Payjp::Customer.create(
#     description: '登録テスト',
#     email: current_user.email,
#     card: params['payjp-token'],
#     metadata: {user_id: current_user.id}
#     )
#     @card = Card.new(
#       user_id: current_user.id,
#       customer_id: customer.id,
#       card_id: customer.default_card
#     )
#     if @card.save
#       redirect_to action: "show"
#     else
#       redirect_to action: "pay"
#     end
#   end
#   end
# def show
#   card = Card.find_by(user_id: current_user.id)
#   if card.blank?
#     redirect_to action: "new" 
#   else
#     Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
#     customer = Payjp::Customer.retrieve(card.customer_id)
#     @default_card_information = customer.cards.retrieve(card.card_id)
#   end
# end

# def delete
#   card = Card.find_by(user_id: current_user.id)
#   if card.blank?
#   else
#     Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
#     customer = Payjp::Customer.retrieve(card.customer_id)
#     customer.delete
#     card.delete
#   end
#   redirect_to action: "new"
# end


  
end

