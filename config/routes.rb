Rails.application.routes.draw do
  devise_for :users

  root 'home#top'
  get 'home/about'

  get 'users/delete_confimation/:id' =>'users#delete_confimation', as: 'user_deletion'
  resources :users,  only: [:show,:edit,:update]

  get 'group_users/delete_confimation/:id' =>'group_users#delete_confimation', as: 'group_user_deletion'
  resources :group_users,only:[:index,:show,:destroy]

  post 'group_requests/:id' => 'group_requests#allow', as:'allow'
  post 'group_requests/:id' => 'group_requests#reject', as:'reject'
  resources :group_requests, only:[:create,:destroy]

  get 'groups/:id/member' => 'groups#member', as:'group_member'
  get 'groups/delete_confimation/:id' =>'groups#delete_confimation', as: 'group_deletion'
  resources :groups, only: [:index,:show,:create,:edit,:update,:destroy]

  resources :group_tasks do
    resources :group_comments, only: [:create, :destroy]
  end
end
