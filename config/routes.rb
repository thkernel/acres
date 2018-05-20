Rails.application.routes.draw do
  resources :companies
  resources :customers
  resources :clients
	get "/dashboard" => "dashboard#index" , as: :dashboard
  get "/customers" => "customers#index", as: :customers_index
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
            registrations: "registrations",
            confirmations: 'confirmations',
            passwords: "passwords"
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
    		root 'devise/sessions#new', as: :unauthenticated_root
  		end
	end
end
