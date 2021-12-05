Rails.application.routes.draw do

#authors
  get '/', to: 'welcome#index'
  get '/authors', to: 'authors#index'
  get '/authors/new', to:'authors#new'
  post '/authors', to: 'authors#create'
  get '/authors/:id', to: 'authors#show'
  get '/authors/:id/edit', to: 'authors#edit'
  patch '/authors/:id', to: 'authors#update'
  get 'authors/:author_id/books', to: 'author_books#index'

#books
  get '/books', to: 'books#index'
  post '/books', to: 'books#create'
  get '/books/new', to:'books#new'
  get '/books/:id', to: 'books#show'
  get '/books/:id/edit', to: 'books#edit'
  patch '/books/:id', to: 'books#update'

  #libraries
  get '/libraries', to: 'libraries#index'
  get '/libraries/new', to: 'libraries#new'
  post '/libraries', to: 'libraries#create'
  get 'libraries/:library_id/guests', to: 'library_guests#index'
  get '/libraries/:id', to: 'libraries#show'
  post '/libraries/:id/edit', to: 'libraries#edit'
  patch '/libraries/:id', to: 'libraries#update'

  #guests
  get '/guests', to: 'guests#index'
  get '/guests/new', to: 'guests#new'
  post '/guests', to: 'guests#create'
  get '/guests/:id', to: 'guests#show'
  post '/guests/:id/edit', to: 'guests#edit'
  patch '/guests/:id', to: 'guests#update'
end
