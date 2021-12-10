Rails.application.routes.draw do

  get 'users/show'
  get 'messages/new'

  devise_for :users
  # rails g devise userをした際に自動生成されるルーティング
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'items#index'
   resources :items do
    # ネストをする場合は親要素のidを持ってくる
    resources :messages, only: [:create,:destroy]
    resources :purchases,only:[:create,:index] 
    # post 'order', on: :member
    # 自分で作ったorderアクションを定義してidが必要なのでmemberを記述。idが不要の場合はcollection
    # memberのidは作ってる要素のidが必要になる
   end
   resources :cards, only: [:new, :create]
end

# user_idに関してはcurrent_user.idがわかればネストしてid情報を紐付けする必要はない
