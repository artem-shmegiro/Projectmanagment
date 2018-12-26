Rails.application.routes.draw do
  devise_for :users
  get 'projects/index'

  resources :projects do
    resources :tasks
  end

  root 'projects#index', as: 'home'
end
