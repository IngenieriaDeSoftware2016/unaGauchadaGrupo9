Rails.application.routes.draw do

  get 'compra/index'

  get 'compra/show'

  get 'compra/create'

  get 'compra/new'

  get 'compra/edit'

  get "gauchadas/postulacion" => 'gauchadas#postulacion', :as => :postulacion

  get '/logros/new' , to: 'logros#new'
  get '/logros/show' , to: 'logros#show'
  get '/under_construction' , to: 'mains#under_construction'
  get '/buscar' , to: 'mains#search'
  get '/usuario' , to: 'usuarios#show'

  devise_for :usuarios, :controllers => { registrations: 'registrations' }

  resources :usuarios
  resources :postulantes
  resources :logros
  resources :gauchadas
  resources :mains
  devise_scope :usuario do
    root :to => 'gauchadas#index'
  end
  get '/usuarios/admin', to:'usuarios#admin'


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
