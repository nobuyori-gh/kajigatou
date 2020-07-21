Rails.application.routes.draw do
  devise_for :users

  root 'home#top'
  get 'home/about'

  resources :users,  only: [:show,:edit,:update]
  get 'users/delete_confimation/:id' =>'users#delete_confimation', as: 'user_deletion'

  resources :groups, only: [:index,:show,:create,:edit,:update,:destroy]
end