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
    root :to => "channels#index"

    # Inloggen
    get    "inloggen"  => "sessions#new",     :as => :login
    get    "archived"  => "channels#archived",     :as => :archived
    get    "live"  => "episodes#live",     :as => :live
    match '/channels/archive/:id' => "channels#archive", :as => 'archive'
    match '/channels/unarchive/:id' => "channels#unarchive", :as => 'unarchive'
    post   "inloggen" => "sessions#create",  :as => :login
    delete "uitloggen" => "sessions#destroy", :as => :logout

    # Resources
    resources :admins
    resources :contact_questions
    resources :users
    resources :contacts
    resources :texts, :only => [:edit, :update, :index]
    resources :channels do
      resources :posts

      resources :challenges
      resources :episodes do
        resources :questions
      end
    end
    resources :pages
    resources :images
    resources :categories do
      put :sort, :on => :collection  # Sorteren van categorieën
    end
  end

  # Hier komen de publieke resources
  get "page/:id"            => "pages#show",          :as => :page
  get "home"                => "pages#index",         :as => :home
  # get "users"                => "users#solutions",         :as => :user_solutions
  match '/users/:id/solutions', :controller => 'users', :action => 'solutions', :as => :user_solutions
  match '/users/:id/ideas', :controller => 'users', :action => 'ideas', :as => :user_ideas

  get "toggle-edit"         => "application#toggle",  :as => :toggle_edit
  resources :subscribers, :only => :create
  resources :users do
    member do
      get :activate
    end
  end

  resources :messages
  resources :contacts, :only => [:create]
  resources :images, :path => "fotos"
  resources :questions, :path => "kijkersvragen"
  resources :admins, :path => "changemakers"
  resources :channels, :path => "programmas" do
    resources :messages
    resources :challenges, :path => "uitdagingen" do
      resources :solutions, :path => "oplossingen" do
        resources :comments
        resources :appreciables
      end
    end
    resources :episodes, :path => "afleveringen" do
      resources :messages
      resources :questions
    end
    resources :posts, :path => "artikelen", :only => [:index, :show] do
      resources :comments
    end
    resources :ideas, :path => "ideeen" do
      resources :comments
      resources :appreciables
    end
  end

  resources :user_sessions
  resources :posts do
    resources :comments
  end

  # gebruiker Inloggen
  match 'login' => 'user_sessions#new', :as => :login
  post 'available' => 'episodes#available', :as => :available
  get    "inloggen"  => "user_sessions#new",     :as => :user_login

  get    "zoeken"  => "application#search",     :as => :search
  get    "registreren"  => "users#new",     :as => :register
  post   "inloggen" => "user_sessions#create",  :as => :user_login
  get "uitloggen" => "user_sessions#destroy", :as => :user_logout

  get    "about"  => "pages#about",     :as => :about
  get    "karma"  => "pages#karma",     :as => :karma
  get    "contact"  => "pages#contact",     :as => :contact
  get    "faq"  => "pages#faq",     :as => :faq


  # Root pad
  root :to => "channels#index"
end

