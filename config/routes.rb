Rails.application.routes.draw do
 
  captcha_route
  resources :areas
  resources :counties
  devise_for :users, controllers: {registrations: 'users/registrations' }
  get 'pages/welcome'
devise_scope :user do
  root "devise/sessions#new"
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
