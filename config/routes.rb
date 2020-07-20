Rails.application.routes.draw do
  devise_for :users

  root 'home#top'
  get 'home/about'

  resources :users,  only: [:show,:edit,:update]
  resources :groups, only: [:index,:show,:create,:edit,:update,:destroy]
end