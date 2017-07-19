Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users, path: '', path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  resources :portfolios, except: [:show] do
    put :sort, on: :collection
  end
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'
  get 'blogs/topic_search/:id', to: 'blogs#topic_search', as: 'topic_search'
  get 'blogs/topic/new', to: 'blogs#new_topic', as: 'new_topic'
  post 'blogs/topic/create', to: "blogs#create_topic", as: 'create_topic'

  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  get 'nil', to: 'pages#nilpage'
  
  resources :blogs do
    member do
      get :toggle_status
    end
  end
  
  mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end
