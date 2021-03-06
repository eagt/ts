Rails.application.routes.draw do

 #match ':controller(/:action(/:id))', :via => [:get, :post]
 
  # root 'static_pages#home'

  #  get 'help'    => 'static_pages#help'

  #  get 'about'   => 'static_pages#about'

  #  get 'contact_us' => 'static_pages#contact_us'



# /** -- Below Mario's code --**/

 # root "access#index"
 # get '/:locale' => 'access#index'

  root "access#index"
  get '/:locale' => 'access#index'

 
  scope "(:locale)", locale: /es|en/ do
    resources :professionals do
      member do
        get :delete
      end
      collection do
        get :login
      end
      resources :companies do
        member do
          get :delete
        end
      end
      resources :branches do
        member do
          get :delete
        end
      end
      resources :clients do
        member do
          get :delete
        end
      end
      resources :appointments do
        member do
          get :delete
        end
      end
    end
  
  end

  scope "(:locale)", locale: /es|en/ do
    resources :companies do
      member do
        get :delete
      end
      collection do
        get :login
      end
      resources :professionals do
        member do
          get :delete
        end
      end
      resources :branches do
        member do
          get :delete
        end
      end
      resources :clients do
        member do
          get :delete
        end
      end
      resources :appointments do
        member do
          get :delete
        end
      end
    end
  
  end

# #   get 'profsign'    => 'professionals#new'

#   get 'compasign' => 'companies#new'

   scope "(:locale)", locale: /es|en/ do
   resources :access
   end


   # /** -- Above Mario's code --**/

#    get 'password_resets/new'

#    get 'password_resets/edit'






#    get   'ulogin'   => 'sessions#new'
#    post   'ulogin'   => 'sessions#create'
#    delete 'ulogout'  => 'sessions#destroy'

# #   # get    'clogin'   => 'sessions#new'
#   # post   'clogin'   => 'sessions#create'
#   # delete 'clogout'  => 'sessions#destroy'


#   # get    'plogin'   => 'sessions#new'
#   # post   'plogin'   => 'sessions#create'
#   # delete 'plogout'  => 'sessions#destroy'
  
 

#   #resources :professionals, :companies, :users

#  #  get 'professionals/index'

#  #  get 'professionals/show'

#   #get 'profsign'    => 'professionals#new'

#  #  #get 'professionals/create'

#  #  get 'professionals/edit'

#  #  #get 'professionals/update'

#  #  get 'professionals/delete'

#  # # get 'professionals/destroy'

#   #get 'compasign' => 'companies#new'

#  #  get 'companies/edit'

 

#  #  get 'companies/index'

#  #  get 'companies/show'

#  #  #get 'companies/new'

#  # # get 'companies/create'

#  #  get 'companies/edit'

#  #  #get 'companies/update'

#  #  get 'companies/delete'

#  #  #get 'companies/destroy'

# # get 'signup'  => 'usersn#ew'
 


   resources :account_activations, only: [:edit]
   resources :password_resets,     only: [:new, :create, :edit, :update]
  
#  #  get 'users/index'

#  #  get 'users/show'

#  #  get 'users/edit'

#  #  #get 'users/create'

 #  #patch 'users/:id' => 'users#update' 

 #  #get 'users/destroy'


  #match ':controller(/:action(/:id))', :via => [:get, :post]

 #  # The priority is based upon order of creation: first created -> highest priority.
 #  # See how all your routes lay out with "rake routes".

 #  # You can have the root of your site routed with "root"
 #  # root 'welcome#index'

 #  # Example of regular route:
 #  #   get 'products/:id' => 'catalog#view'

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
