Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "pages#home"
  get "users/sign_out", to: "users#logy"
  get 'add_item/:coc_id', to: "roads#add_item", as: 'add_item'
  get 'add_item_last/:coc_id', to: "roads#add_item_last", as: 'add_item_last'
  get 'eliminate_tray/:i_id', to: "roads#eliminate_item", as: 'eliminate_item'
  get 'pay/:order_id', to: "orders#pay", as: 'pay'
  get 'wait/:order_id', to: "orders#wait", as: 'wait'
  get 'admin', to: "orders#admin", as: 'admin'
  get 'search', to: "orders#pannel"
  get 'ready/:id', to: "orders#ready", as: 'ready'
  get 'disp/:id', to: "orders#disp", as: 'disp'
  get 'elim/:id', to: "orders#elim", as: 'elim'
  get 'elim2/:id', to:"orders#elim2", as: 'elim2'
  get 'pending', to: "orders#pending", as: 'pending'
  resources :customers do
    resources :orders
  end
  resources :trees do
    resources :roads
  end
  resources :trees
end

#sample@sample.com123456