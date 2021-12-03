Rails.application.routes.draw do
  get '/', to: 'welcome#index'
  get '/authors', to: 'authors#index'
  get '/books', to: 'books#index'
  get '/libraries', to: 'libraries#index'
  get '/guests', to: 'guests#index'
  get '/authors/:id', to: 'authors#show'
  get '/libraries/:id', to: 'libraries#show'

  get '/guests/:id', to: 'guests#show'
  get 'libraries/:library_id/guests', to: 'library_guests#index'


  get '/books/:id', to: 'books#show'

  get '/authors/:author_id/books', to: 'author_books#index'


end
