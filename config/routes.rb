Rails.application.routes.draw do
  
  # Semi-static page routes
  get 'home', to: 'home#index', as: :home
  get 'home/about', to: 'home#about', as: :about
  get 'home/contact', to: 'home#contact', as: :contact
  get 'home/privacy', to: 'home#privacy', as: :privacy
  get 'home/search', to: 'home#search', as: :search
  root 'home#index'


  # Authentication and users
  resources :sessions
  resources :users
  get 'users/new', to: 'users#new', as: :signup
  get 'user/edit', to: 'users#edit', as: :edit_current_user
  get 'login', to: 'sessions#new', as: :login
  get 'logout', to: 'sessions#destroy', as: :logout

  # Default routes
  resources :outreach_workers
  resources :re_entrants
  resources :flags
  resources :resources
  resources :tags

  # Special routes
  get 'resources/share', to: 'transaction#new', as: :share_resource_path

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
