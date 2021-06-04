Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  get '/suppliers', to: 'supplier#index', as: 'suppliers'
  get '/suppliers/show/:id', to: 'supplier#show', as: 'supplier_show'
  get '/suppliers/new', to: 'supplier#new', as: 'supplier_new'
  get '/suppliers/edit/:id', to: 'supplier#edit', as: 'supplier_edit'
  post '/suppliers/create', to: 'supplier#create', as: 'supplier_create'
  delete '/suppliers/delete', to: 'supplier#destroy', as: 'supplier_delete'
  post '/suppliers/update', to: 'supplier#update', as: 'supplier_update'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
