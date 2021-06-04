Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  get '/suppliers', to: 'supplier#index', as: 'suppliers'
  get '/suppliers/show/:id', to: 'supplier#show', as: 'supplier_show'
  get '/suppliers/new', to: 'supplier#new', as: 'supplier_new'
  get '/suppliers/:id/edit', to: 'supplier#edit', as: 'supplier_edit'
  post '/suppliers', to: 'supplier#create', as: 'supplier_create'
  delete '/suppliers/:id', to: 'supplier#destroy', as: 'supplier_delete'
  put '/suppliers/:id', to: 'supplier#update', as: 'supplier_update'
  root to: 'supplier#index', as: 'root'
  authenticated :user do
    root to: 'supplier#index', as: 'logged_user_root'
  end
  devise_scope :user do
    unauthenticated :user do
      root to: 'users/sessions#new', as: 'not_logged_user_root'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
