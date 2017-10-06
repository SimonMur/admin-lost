Rails.application.routes.draw do
  captcha_route
  devise_for :users
  get 'pages/welcome'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
