Rails.application.routes.draw do
  namespace :admin do
    root 'application#index'
    resources :skills
    resources :users
  end

  root 'static_pages#home'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
