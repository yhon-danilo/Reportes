Reportes::Application.routes.draw do
  get "reportes/index"
  get "reportes/show"
  get "reportes/edit"
  get "usuarios/index"
  get "usuarios/show"
  get "usuarios/edit"
  #get "administrador/index"
  resources :sessions
  
   resources :users do
    resources :reportes
  end
  get "logout" => 'sessions#destroy', :as => 'logout' 
  get "login" => 'sessions#new', :as => 'login' 
  #get "/users/:user_id/reportes/:id" => 'reportes#destroy', :as => 'Borrar'
  root to: 'sessions#new'
  match "signup", to: "users#new", via: [:get]
  match "profile", to: "sessions#profile", via: [:get]
  match "setting", to: "sessions#setting", via: [:get]
  #et 'administrador/index'
  #get 'administrador/reportes_index'
  namespace :admin do 
    resources :users do
      resources :reportes
    end
  end
  #match 'controller(/:action(/:id))'
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
