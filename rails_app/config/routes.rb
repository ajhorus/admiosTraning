RailsApp::Application.routes.draw do
  root :to => 'homes#index'

  post 'posts/create', to: 'posts#create'
  
  get '/auth/:provider/callback', to: 'authentications#create'
  get '/homes/admin_user', to: 'homes#admin_user'
  get '/homes/destroy/:id', to: 'homes#destroy_user'

  resources :posts
  resources :authentications
  resources :homes
  
  authenticated :user do
    root :to => 'homes#index'
  end

  devise_for :users
 
end
