Rails.application.routes.draw do
 
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :posts do
    resource :favorites, only: [:create,:destroy]
  end  
  devise_for :users
  root to: 'posts#index'
   resources :users, only: [:show]
   
   resources :cards, only: [:new, :show] do
 collection do
   post 'show', to: 'cards#show'
   post 'pay', to: 'cards#pay'
   post 'delete', to: 'cards#delete'
 end
end

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
