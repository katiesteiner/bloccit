Rails.application.routes.draw do

  devise_for :users
  resources :users, only: [:update]
  resources :questions
  
  resources :advertisements

  resources :topics do
    resources :posts, except: [:index]
  end

  get 'about' => 'welcome#about'

  get 'welcome/contact'

  root to: 'welcome#index'



end
