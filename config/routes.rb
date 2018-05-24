Rails.application.routes.draw do
  resources :logs
  resources :contributors
  resources :producers
  resources :credits
  resources :banks
  resources :profiles
  resources :companies
  resources :customers
  resources :clients
  #resources :custom_users

  get "/dashboard" => "dashboard#index" , as: :dashboard
  get "/customers" => "customers#index", as: :customers_index
  get "/users"     => "custom_users#index", as: :all_users
  post "/users/new"     => "custom_users#create", as: :create_user
  get "/users/new"     => "custom_users#new", as: :new_user
  get "/user/edit/:id" => "custom_users#edit", as: :edit_user
  delete "/user/delete/:id" => "custom_users#delete", as: :delete_user
  get "/user/delete/:id" => "custom_users#delete", as: :get_delete_user
  get "/user/show/:id" => "custom_users#show", as: :show_user
  #devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #devise_for :users, path: 'user', path_names: { 
        #sign_in: 'login', 
        #sign_out: 'logout', 
        #password: 'secret', 
        #confirmation: 'verification', 
        #unlock: 'unblock', 
        #registration: 'register', 
        #sign_up: '' 

    #}

    devise_for :users, path: '', controllers: { 
            registrations: "users/registrations",
            confirmations: 'users/confirmations',
            passwords: "users/passwords",
            sessions: "users/sessions"
            
        }, 
        path_names: {
            sign_in: 'login', 
            sign_out: 'logout', 
            password: 'secret', 
            confirmation: 'verification', 
            unlock: 'unblock', 
            registration: 'signup', 
            sign_up: '' 
        }

        devise_scope :user do
 		authenticated :user do
    		root 'dashboard#index', as: :authenticated_root
  		end

  		unauthenticated do
    		root 'users/sessions#new', as: :unauthenticated_root
  		end
    end


end
