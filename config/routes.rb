Rails.application.routes.draw do
  
  # Semi-static page routes
  get 'home', to: 'home#index', as: :index
  get 'home/about', to: 'home#about', as: :about
  get 'home/contact', to: 'home#contact', as: :contact
  get 'home/privacy', to: 'home#privacy', as: :privacy
  get 'home/search', to: 'home#search', as: :search
  get 'home/filter', to: 'home#filter', as: :filter
  root 'home#index'


  # Authentication and users
  resources :sessions
  resources :users
  get 're_entrants/new', to: 're_entrants#new', as: :signup
  get 'user/edit', to: 'users#edit', as: :edit_current_user
  get 'login', to: 'sessions#new', as: :login
  get 'logout', to: 'sessions#destroy', as: :logout

 # Special routes
  get 'resources/:id/share/', to: 'transactions#new', as: :share_resource_path
  get 'resources/:id/confirm', to: 'transactions#confirm', as: :confirm_resource_path

  # Additional Quality-of-life routes
  get 're_entrants/referrals', to: 're_entrants#referrals', as: :get_reentrant_referral_path

  get 'outreach_workers/referred_users', to: 'outreach_workers#referred_users', as: :get_referred_users_path
  get 'outreach_workers/referrals', to: 'outreach_workers#referral', as: :get_sow_referral_path


  # Default routes
  resources :outreach_workers
  resources :re_entrants
  resources :flags
  resources :resources
  resources :tags
  resources :transactions

  
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
