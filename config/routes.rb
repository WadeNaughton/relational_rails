Rails.application.routes.draw do
  get '/', to: 'welcome#index'
  get '/libraries', to: 'libraries#index'
  get '/guests', to: 'guests#index'
end
