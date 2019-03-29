Rails.application.routes.draw do
  
  # Semi-static page routes
  get 'home', to: 'home#index', as: :home
  get 'home/about', to: 'home#about', as: :about
  get 'home/contact', to: 'home#contact', as: :contact
  get 'home/privacy', to: 'home#privacy', as: :privacy
  get 'home/search', to: 'home#search', as: :search
  root 'home#index'

  resources :outreach_workers
  resources :re_entrants
  resources :flags
  resources :resources
  resources :tags
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
