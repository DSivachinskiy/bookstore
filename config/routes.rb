Rails.application.routes.draw do

  devise_for :admins
  mount RailsAdmin::Engine => '/Admin', as: 'rails_admin'
 

  resources :billing_adresses

  resources :credit_cards

  resources :adresses

  resources :order_items

  resources :orders do
    resources :build, controller: 'orders/build'
  end
  
devise_for :costumers, path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }, :controllers => { :omniauth_callbacks => "costumers/omniauth_callbacks" }
  resources :ratings

  resources :authors

  resources :categories


  resources :books
 root 'start#index'

resources :costumers


resource :checkout do 
  get :adress
  get :delivery
  get :payment
  get :confirm
  get :complete
end
#   '/checkout/adress', :to  => "checkout#adress"
# get '/checkout/delivery', :to  => "checkout#delivery"
# get '/checkout/payment', :to  => "checkout#payment"
# get '/checkout/confirm', :to  => "checkout#confirm"
# get '/checkout/complete', :to  => "checkout#complete"

get '*unmatched_route', to: 'application#not_found'

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
