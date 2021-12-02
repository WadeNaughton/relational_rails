Rails.application.routes.draw do
  get '/', to: 'welcome#index'
  get '/authors', to: 'authors#index'
  get '/books', to: 'books#index'
  get '/libraries', to: 'libraries#index'
  get '/guests', to: 'guests#index'
  get '/authors/:id', to: 'authors#show'
  get '/libraries/:id', to: 'libraries#show'

end
