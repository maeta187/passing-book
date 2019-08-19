Rails.application.routes.draw do
  # get 'bookshelves/new'
  # get 'bookmarks/new'
  # post 'bookmarks/new'
  # post 'bookmarks/save', to:  'bookmarks#save'
  # get  'bookshelf/new'
  post 'bookshelves/save', to:  'bookshelves#save'
  # get 'urls/new'
  # get 'urls/show'
  get 'sessions/new'
  root 'pages#index'
  get 'pages/help'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users
  resources :bookmarks
  resources :urls
  resources :bookshelves
  

end