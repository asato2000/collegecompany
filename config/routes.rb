Rails.application.routes.draw do
  resources :posts do
    resource :favorites, only: [:create,:destroy]
  end  
  devise_for :users
  root to: 'posts#index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
