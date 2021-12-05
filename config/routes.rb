Rails.application.routes.draw do
#Authors

  get '/', to: 'welcome#index'
  get '/authors', to: 'authors#index'
  post '/authors', to: 'authors#create'
  get '/authors/new', to:'authors#new'
  get '/authors/:id', to: 'authors#show'

  #books
  get '/books', to: 'books#index'
  post '/books', to: 'books#create'
  get '/books/new', to:'books#new'
  get '/books/:id', to: 'books#show'

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
  get '/authors/:author_id/books', to: 'author_books#index'
  get '/guests/:id', to: 'guests#show'
  post '/guests/:id/edit', to: 'guests#edit'
  patch '/guests/:id', to: 'guests#update'
end
