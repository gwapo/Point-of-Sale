Mypos::Application.routes.draw do
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "sign_up" => "users#new", :as => "sign_up"

  resources :sessions
  resources :users

  resources :accounts do
    collection do
       get 'schedules'
       get 'list'
     end
  end

  resources :receiving_items

  resources :receivings

  get "reports/index"
  get "reports/itemsearch"
  get "reports/sales"
  get "reports/customersales"
  get "reports/employeesales"
  get "reports/lowinventory"
  get "reports/highinventory"

  resources :inventories
  resources :sale_items
  resources :customers do
    collection do
       get 'searchcustomer'
     end
  end
  resources :sales do
    collection do
        get :sale_return
        get :purchase
        post :sale_return_create
    end
  end

  resources :items do
    collection do
       get 'itemlist'
       get 'newitem'
       post :create_item
     end
  end

  resources :employees  do
    collection do
       get 'searchemployee'
     end
  end

  resources :suppliers  do
    collection do
       get 'searchsupplier'
     end
  end

  resources :store_configs
    root :to => "store_configs#index"
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end

