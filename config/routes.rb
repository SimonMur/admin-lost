Rails.application.routes.draw do
 
  get 'users/edit'

  get 'users/show'

  get 'users/index'

  resources :plans
  captcha_route
  resources :areas
  resources :users, only: [:show]
  resources :counties
  devise_for :users, controllers: {registrations: 'users/registrations', sessions: 'users/sessions' }
  get 'pages/welcome'
devise_scope :user do
  root "devise/sessions#new"
   get "/admin", to: "pages#welcome"
    
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
