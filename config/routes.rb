Rails.application.routes.draw do
  

  resources :user_commission_editions
  resources :bank_commission_editions
  resources :app_configs
  resources :super_admin_configs
  resources :config_options
  resources :credit_details
  resources :notaries do
    get 'delete'
  end
  #resources :commissions
  resources :commission_settings
  resources :roles
  resources :mail_configurations
  resources :logs
  resources :credits
  resources :banks
  resources :profiles
  #resources :companies
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
  get "/users/unregistered"     => "custom_users#unregistered", as: :unregistered_commission_percentage 
  
  post "/users/new"     => "custom_users#create", as: :create_user
  get "/users/new"     => "custom_users#new", as: :new_user
  get "/user/edit/:id" => "custom_users#edit", as: :edit_user

  patch "/user/update/:id" => "custom_users#update", as: :udapte_user

  #get "/commissions/settings/new"     => "commission_settings#new", as: :new_commission_setting
  #get "/commissions/settings/edit/:id" => "commission_settings#edit", as: :edit_commission_setting
  
  delete "/user/destroy/:id" => "custom_users#destroy", as: :destroy_user
  get "/credits/delete/:id" => "credits#delete", as: :delete_credit
  delete "/credits/destroy/:id" => "credits#destroy", as: :destroy_credit
  get "/user/delete/:id" => "custom_users#delete", as: :delete_user
  
  get "/user/enable/:id" => "custom_users#get_enable", as: :get_enable_user_account
  post "/user/enable/:id" => "custom_users#post_enable", as: :post_enable_user_account

  get "/user/disable/:id" => "custom_users#get_disable", as: :get_disable_user_account
  post "/user/disable/:id" => "custom_users#post_disable", as: :post_disable_user_account

  get "/user/update/:id" => "custom_users#update", as: :update_user

  get "/settings/mail" => "mail_configurations#settings", as: :mail_settings

  get "/user/show/:id" => "custom_users#show", as: :show_user
  #get "/logs/import" => "logs#import", as: :import_file
  post "/logs/import" => "logs#import", as: :import_file


  
  get "/companies/index" => "companies#index" , as: :companies
  post "/companies/new/" => "companies#create", as: :create_company
  get "/companies/new/" => "companies#new", as: :new_company
  get "/companies/:id" => "companies#show", as: :show_company
  get "/companies/edit/:id" => "companies#edit", as: :edit_company
  patch "/companies/:id"  => "companies#update", as: :company



  get "/commissions/contributors" => "commissions#contributors", as: :contributors_commissions
  get "/commissions/producers" => "commissions#producers", as: :producers_commissions
  
  get "/commissions/banks" => "commissions#banks", as: :banks_commissions
  get "/profile/settings" => "profiles#settings", as: :profile_settings

  get "/commissions/resume/producer/:producer_name" => "commissions#resume_producer", as: :producer_resume
  get "/commissions/resume/contributor/:contributor_name" => "commissions#resume_contributor", as: :contributor_resume
  get "/commissions/resume/bank/:bank_name" => "commissions#resume_bank", as: :bank_resume

  #get "/notaries/index" => "notaries#index", as: :notaries
  #get "/nataries/new" => "notaries#new", as: :new_notary
  
  get 'search' => 'search#search', as: :search
  get 'export/excel' => 'search#search', as: :export_to_excel

  get 'show/producer/credit/details/:id' => 'credit_details#producer_credit_details', as: :show_producer_credit_details
  get 'show/contributor/credit/details/:id' => 'credit_details#contributor_credit_details', as: :show_contributor_credit_details

  #get 'credit/details/new/' => 'credit_details#new', as: :new_credit_detail
  get '/superadmin/config' => 'super_admin_configs#new', as: :super_admin_setup
  get '/app/config' => 'app_configs#new', as: :app_setup
  get '/unauthorize' => 'dashboard#unauthorize', as: :unauthorize




  
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

		#root 'config_options#new'
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
