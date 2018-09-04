Rails.application.routes.draw do

  get 'comments/new'
  get 'comments/destroy'
  get 'comments/show'
  get 'comments/edit'
  resource :session, only: [:new, :create, :destroy]

  resources :stories do
    resources :comments
    member do
      put "like", to: "stories#upvote"
    end
  end

  get 'users/new'
  resources :users

  root 'stories#index'


  #Gene's addition
  resources :comments do
    resources :comments
  end



end
