Rails.application.routes.draw do
  get '/', to: 'welcome#index'

  get '/authors', to: 'authors#index'
end
