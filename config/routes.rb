Crowdrevolt::Application.routes.draw do
  #password reset
  resources :password_resets

  #user sessions
  get "user_session/new"
  get "user_session/create"
  get "user_session/destroy"

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
    resources :channels do
      resources :episodes
    end
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
  resources :users do
    member do
      get :activate
    end
  end

  resources :images
  resources :channels do
    resources :episodes
    resources :posts
    resources :ideas
    resources :changemakers
    resources :challenges do
      resources :solutions
    end
  end

  resources :user_sessions
  resources :posts do
    resources :comments
  end

  # gebruiker Inloggen
  match 'login' => 'user_sessions#new', :as => :login
  get    "inloggen"  => "user_sessions#new",     :as => :user_login
  get    "registreren"  => "users#new",     :as => :register
  post   "inloggen" => "user_sessions#create",  :as => :user_login
  delete "uitloggen" => "user_sessions#destroy", :as => :user_logout

  # Root pad
  root :to => "pages#index"
end

