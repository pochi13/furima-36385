Rails.application.routes.draw do

  get 'users/show'
  get 'messages/new'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'items#index'
   resources :items do
    resources :messages, only: [:create,:destroy]
    resources :purchases,only:[:create,:index] 
    post 'order', on: :member
   end
   resources :cards, only: [:new, :create]
end
