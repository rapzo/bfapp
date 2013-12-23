Bfapp::Application.routes.draw do
  namespace :admin do
    resources :orders
  end

  namespace :admin do
    resources :articles
  end

  namespace :admin do
    resources :users
  end

  namespace :admin do
    resources :clients
  end

  namespace :admin do
    resources :managers
  end

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
  
  root "articles#index"
  
  get "about/this" => "pages#index"

  get "about" => "pages#about"

  # mount Foundation::Rails::Engine => "/styleguide" if Rails.env.development?

  get "login" => "sessions#new", :as => "login"
  get "logout" => "sessions#delete", :as => "logout"

  get "catalog/:code"=> "articles#show", :as => "catalog_show"

  resources :sessions, :only => [:create, :destroy]

  resources :clients, param: :code do
    resources :users

    post 'activate' => "users#activate", :as => "activate"

    resources :orders, param: :doc
  end

  get 'clients/:code' => "clients#show", :as => "current_user"

  post 'users/:id/cart/:article/add/:q' => "users#add_to_cart", :as => "add_to_cart", :constraints => { :article => /[\w+\.]+/ }
  delete 'users/:id/cart/:order_id/delete' => "users#remove_from_cart", :as => "remove_from_cart"
  get 'users/:id/cart/checkout' => "users#checkout", :as => "checkout"

  resources :managers

end
