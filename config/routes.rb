Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'lists#index'
  resources :movies, only: [:show]
  resources :lists do
    resources :bookmarks, only: [:create, :new]
  end
  resources :bookmarks, only: [:destroy]
  # get 'list/:id/add-movie', to: 'list#search_movie', as 'add_movie_list'
  # post 'list/:id/add-movie', to: 'list#add_movie', as 'add_movie_list'
end
