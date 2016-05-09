LatoCore::Engine.routes.draw do
  root 'back/back#home'

  # Authentication
  get 'login', to: 'back/authentication#login', as: 'login'
  post 'exec_login', to: 'back/authentication#exec_login', as: 'exec_login'
  delete 'exec_logout', to: 'back/authentication#exec_logout', as: 'exec_logout'

  # Users
  resources :superusers, module: 'back'

end
