Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#landing'
  resources :movies, only: [:show]
  resources :lists
  resources :bookmarks
end
