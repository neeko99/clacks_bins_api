Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :addresses, only: %i[show index]
  resources :bin_types, only: :index

  resources :collections, only: %i[show index]
end
