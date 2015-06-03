Rails.application.routes.draw do
  match '/payments/payment', :to => 'payments#payment', :as => 'paymentspayment', :via => [:get]
  match '/payments/thank_you', :to => 'payments#thank_you', :as => 'payments_thank_you', :via => [:get]
  get 'companies/index'

  get 'companies/show'

  get 'companies/new'

  get 'companies/edit'

  resources :blogs

  resources :states

  resources :countries

  resources :orders do 
    collection { post :import }
    collection do
      get 'search'
      get 'autocomplete'
      
    end
  end
  
  namespace :api do
  #namespace :api, path: '', constraints: {subdomain: 'api'}, defaults: {format: 'json'} do
  namespace :v1 do
    resources :orders
  end
end

  namespace :admin do
  get 'users/index'
  end

  namespace :admin do
    #resources :users 
  get 'users/edit'
  end
  
  namespace :admin do
  get 'users/update_status' => 'users#update_status'
  end

  namespace :admin do
   patch 'users/update_user' 
  end
  
  namespace :admin do
    get 'users/show_order' => 'users#show_order'
  end

  namespace :admin do
  get 'users/delete'
  end
  
  authenticated :user do
    root 'users#index'
  end

  devise_for :users
  resources :employees do
    member do 
      get 'subscribe_user'
    end
    collection do
      get 'user_list'
    end
  end
    
  get  "/employees/find_state/:id" => "employees#find_state"
  
  resources :conversations do
    resources :messages
  end
  
  #mount API::Root => '/'
  #get  "/employees/subscribe_user/:id" => 
  #get  "/employees/user_list" => "employees#user_list"

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
