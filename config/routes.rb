Rails.application.routes.draw do
 


  resources :payments
  get 'searches/search'

  get 'searches/found'

  get 'searches/lost'

  resources :transactions
  resources :accounts
 get 'notifications/:id/link_through', to: 'notifications#link_through',
                                        as: :link_through
get 'notifications', to: 'notifications#index'
  resources :lostitems
  resources :types
  resources :plans
  captcha_route
  resources :areas
  resources :counties

  devise_for :users, controllers: {registrations: 'users/registrations', sessions: 'users/sessions' }

  match '/users/:id',     to: 'users#show',       via: 'pacth' 
  match '/users/:id',     to: 'users#show',       via: 'get'
  match '/users/:id/edit',     to: 'users#edit',       via: 'get'
  match '/users',   to: 'users#index',   via: 'get'
  match '/user/',   to: 'users#update',   via: 'patch'
  match '/users/:id',   to: 'users#update',   via: 'patch'
  match '/users.:id',   to: 'users#update',   via: 'put'

devise_scope :user do
  root "pages#welcome" 
end
get "/admin", to: "pages#welcome"
get "/choose_plan", to: "users#edit"
get "/profile", to: "users#show"
get "/searches", to: "searches#search"
get "/found", to: "searches#found"
get "/lost", to: "searches#lost"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
