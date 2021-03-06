Rails.application.routes.draw do

  resources :comentarios
  get 'imagen/new'

  get 'compras/ganancias'

  get 'imagen/create'

  get 'imagen/update'

  get 'imagen/edit'

  get 'imagen/destroy'

  get 'imagen/index'

  get 'imagen/show'

  get 'compra/index'

  get 'compra/show'
  get 'compra/create'

  get 'compra/new'
  get 'compra/edit'


  get "gauchadas/postulacion" => 'gauchadas#postulacion', :as => :postulacion
  get "usuarios/ranking" => 'usuarios#ranking', :as => :ranking

  #get "gauchadas/:id/postulantes" => 'gauchadas#postulantes', :as => :gauchadas_postulantes
  controller :gauchadas do
    get 'gauchadas/:id/postulantes' => :postulantes, :as => :gauchadas_postulantes
  end


  get 'gauchadas/:id/positivo' , to: 'gauchadas#positivo', :as => :positivo
  get 'gauchadas/:id/negativo' , to: 'gauchadas#negativo', :as => :negativo
  get 'gauchadas/:id/rechazar' , to: 'gauchadas#rechazar', :as => :rechazar
  get '/logros/new' , to: 'logros#new'
  get '/postulantes/:id/aceptar' , to: 'postulantes#aceptar', :as => :aceptar_postulante
  get '/logros/show' , to: 'logros#show'
  get '/under_construction' , to: 'mains#under_construction'
  get '/buscar' , to: 'mains#search'
  get '/usuario' , to: 'usuarios#show'
  get '/usuario/misgauchadas' , to: 'usuarios#misgauchadas', :as => :misgauchadas
  get '/usuario/misgauchadascompletadas' , to: 'gauchadas#misgauchadascompletadas', :as => :misgauchadascompletadas_postulaciones
  get '/compras/ganancias' , to: 'compras#ganancias', :as => :ganancias_compras

  get '/compras/reporte' , to: 'compras#reporte', :as => :reporte_compras

  devise_for :usuarios, :controllers => { registrations: 'registrations' }

  resources :usuarios
  resources :compras
  resources :postulantes
  resources :logros
  resources :gauchadas
  resources :imagens
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
