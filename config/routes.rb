Rails.application.routes.draw do
  resources :commission_settings
  resources :roles
  resources :mail_configurations
  resources :logs
  resources :credits
  resources :banks
  resources :profiles
  resources :companies
  resources :customers

  resources :customers do
    get 'delete'
  end

  resources :banks do
    get 'delete'
  end
  
  resources :credits do
    get 'delete'
  end

  

 

  get "/dashboard" => "dashboard#index" , as: :dashboard
  get "/customers" => "customers#index", as: :customers_index
  get "/users"     => "custom_users#index", as: :all_users
  post "/users/new"     => "custom_users#create", as: :create_user
  get "/users/new"     => "custom_users#new", as: :new_user
  get "/user/edit/:id" => "custom_users#edit", as: :edit_user

  #get "/commissions/settings/new"     => "commission_settings#new", as: :new_commission_setting
  #get "/commissions/settings/edit/:id" => "commission_settings#edit", as: :edit_commission_setting
  
  delete "/user/destroy/:id" => "custom_users#destroy", as: :destroy_user
  get "/credits/delete/:id" => "credits#delete", as: :delete_credit
  delete "/credits/destroy/:id" => "credits#destroy", as: :destroy_credit
  get "/user/delete/:id" => "custom_users#delete", as: :delete_user
  get "/user/update/:id" => "custom_users#update", as: :update_user

  get "/user/show/:id" => "custom_users#show", as: :show_user
  #get "/logs/import" => "logs#import", as: :import_file
  post "/logs/import" => "logs#import", as: :import_file
  get "/companies/new/:slug" => "companies#new", as: :complete_company

  get "/commissions/contributors" => "commissions#contributor", as: :contributors_commissions
  get "/commissions/producers" => "commissions#producer", as: :producers_commissions
  get "/commissions/banks" => "commissions#bank", as: :banks_commissions
  get "/profile/settings" => "profiles#settings", as: :profile_settings




  
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
	
	%w( 404 422 500 ).each do |code|
		get code, :to => "errors#show", :code => code
	  end


end
