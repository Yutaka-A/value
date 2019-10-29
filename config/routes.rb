Rails.application.routes.draw do
  # resources :comments
  get '/' => "home#top"
  get 'about' => "home#about"
  get 'posts/index' => "posts#index"
  get 'privacy_policy' => "home#privacy_policy"
  get 'terms_of_service' => "home#terms_of_service"
  get '/auth/:provider/callback' => "sessions#create"
  
  post 'installs/:post_id/create' => "installs#create"
  post 'installs/:post_id/destroy' => "installs#destroy"
  
  get '/login' => "users#login_form"
  post '/login' => "users#login"
  post '/logout' => "users#logout"
  
  get 'users/signup' => "users#signup"
  get 'users/:id' => "users#show"
  get 'users/:id/edit' => "users#edit"
  post 'users/create' => "users#create"
  post 'users/:id/update' => "users#update"
  
  get 'posts/new' => "posts#new"
  post 'posts/create' => "posts#create"

  
  get 'posts/:id' => "posts#show"
  get 'posts/:id/edit' => "posts#edit"
  post 'posts/:id/update' => "posts#update"
  post 'posts/:id/destroy' => "posts#destroy"
  
  # get 'comments/new' => "comments#new"
  
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
