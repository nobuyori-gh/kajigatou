Rails.application.routes.draw do
  devise_for :users

  root 'home#top'
  get 'home/about'

  resources :users,  only: [:show,:edit,:update]
  get 'users/delete_confimation/:id' =>'users#delete_confimation', as: 'user_deletion'
  resources :group_users,only:[:index,:show,:destroy]
  post '/group_requests/:id' => 'group_requests#allow', as:'allow'
  post '/group_requests/:id' => 'group_requests#reject', as:'reject'
  resources :group_requests, only:[:index,:create,:destroy]
  resources :groups, only: [:index,:show,:create,:edit,:update,:destroy]
end