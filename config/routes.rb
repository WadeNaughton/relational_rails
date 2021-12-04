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
  get '/guests/:id', to: 'guests#show'
  get 'libraries/:library_id/guests', to: 'library_guests#index'

  
  get '/books/:id', to: 'books#show'


  get '/libraries', to: 'libraries#index'
  get '/guests', to: 'guests#index'

  get '/libraries/:id', to: 'libraries#show'
  get '/authors/:author_id/books', to: 'author_books#index'


end
