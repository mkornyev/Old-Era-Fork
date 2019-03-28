Rails.application.routes.draw do
  resources :outreach_workers
  resources :re_entrants
  resources :flags
  resources :resources
  resources :tags
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
