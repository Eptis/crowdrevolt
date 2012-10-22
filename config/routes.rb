Crowdrevolt::Application.routes.draw do
# Admin namespace
  namespace :admin do
    # Admin root
    root :to => "posts#index"

    # Inloggen
    get    "inloggen"  => "sessions#new",     :as => :login
    post   "inloggen" => "sessions#create",  :as => :login
    delete "uitloggen" => "sessions#destroy", :as => :logout

    # Resources
    resources :admins
    resources :users
    resources :pages
    resources :posts
    resources :images
    resources :categories do
      put :sort, :on => :collection  # Sorteren van categorieën
    end
  end

  # Hier komen de publieke resources
  get "page/:id"            => "pages#show",          :as => :page
  get "home"                => "pages#index",         :as => :home

  get "toggle-edit"         => "application#toggle",  :as => :toggle_edit
  resources :subscribers, :only => :create
  resources :users
  resources :posts

  # gebruiker Inloggen
  get    "inloggen"  => "sessions#new",     :as => :user_login
  post   "inloggen" => "sessions#create",  :as => :user_login
  delete "uitloggen" => "sessions#destroy", :as => :user_logout

  # Root pad
  root :to => "pages#index"
end

