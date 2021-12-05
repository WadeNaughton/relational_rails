Rails.application.routes.draw do


  get '/', to: 'welcome#index'
  get '/authors', to: 'authors#index'
  get '/authors/new', to:'authors#new'
  post '/authors', to: 'authors#create'
  get '/authors/:id', to: 'authors#show'
  get '/authors/:id/edit', to: 'authors#edit'
  patch '/authors/:id', to: 'authors#update'


  get '/books', to: 'books#index'
  post '/books', to: 'books#create'
  get '/books/new', to:'books#new'
  get '/books/:id', to: 'books#show'
  get '/books/:id/edit', to: 'books#edit'
  patch '/books/:id', to: 'books#update'

  get '/guests/new', to: 'guests#new'
  post '/guests', to: 'guests#create'
  get '/guests/:id', to: 'guests#show'

  get '/libraries/:library_id/guests', to: 'library_guests#index'


  get '/books/:id', to: 'books#show'


  get '/libraries', to: 'libraries#index'
  get '/guests', to: 'guests#index'


  get '/libraries/new', to: 'libraries#new'
  post '/libraries', to: 'libraries#create'


  get '/libraries/:id', to: 'libraries#show'
  get '/authors/:author_id/books', to: 'author_books#index'


end
