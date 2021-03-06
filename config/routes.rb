Rails.application.routes.draw do
  
  resources :tropas

  resources :recursos

  get 'menu/menu_user'

  get 'menu/menu_admin'

  get 'menu/tropas'

  get 'menu/recursos'  

  get 'welcome/index'

  get 'combate/preparados'

  get 'combate/victoria'

  get 'combate/empate'

  get 'combate/derrota'

  post ':controller(/:action(/:id))'
  get  ':controller(/:action(/:id))'

  #metodos para las vistas de combate
  #get "/combate/preparados" => "combate#preparados"
  #get "/combate/batalla" => "combate#batalla"

  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'


  #get  '/batalla_combate' =>  'combate#batalla'
   
  #get "menu/agregartropa/:id" => 


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
