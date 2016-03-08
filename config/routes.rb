Rails.application.routes.draw do

 #match ':controller(/:action(/:id))', :via => [:get, :post]
  # get 'employments/index'

  # get 'employments/show'

  # get 'employments/new'

  # get 'employments/edit'

  # get 'employments/delete'

  # get 'updates_deletes/index'

  # get 'updates_deletes/show'

  # get 'updates_deletes/new'

  # get 'updates_deletes/edit'

  # get 'updates_deletes/delete'

  # get 'payment_details/index'

  # get 'payment_details/show'

  # get 'payment_details/new'

  # get 'payment_details/edit'

  # get 'payment_details/delete'

  # get 'payment_details/index'

  # get 'payment_details/show'

  # get 'payment_details/new'

  # get 'payment_details/edit'

  # get 'payment_details/delete'

  # get 'contact_details/index'

  # get 'contact_details/show'

  # get 'contact_details/new'

  # get 'contact_details/edit'

  # get 'contact_details/delete'

  # get 'branches/index'

  # get 'branches/show'

  # get 'branches/new'

  # get 'branches/edit'

  # get 'branches/delete'

  # get 'appointments/index'

  # get 'appointments/show'

  # get 'appointments/new'

  # get 'appointments/edit'

  # get 'appointments/delete'

  # get 'clients/index'

  # get 'clients/show'

  # get 'clients/new'

  # get 'clients/edit'

  # get 'clients/delete'

   root 'static_pages#home'

   get 'help'    => 'static_pages#help'

   get 'about'   => 'static_pages#about'

   get 'contact_us' => 'static_pages#contact_us'

  # get 'signup'  => 'users#new'  # I need to Find a way to do it in a better way.


  resources :users
 
  
  resources :companies do
    member do
      get :delete
    end
  end
  


  resources :appointments do
     member do
        get :delete
    end
  end

   resources :professionals do
     member do
        get :delete
    end
  end

  resources :clients do
     member do
        get :delete
    end
  end

  resources :branches do
     member do
        get :delete
    end
  end

  resources :updates_deletes do
     member do
        get :delete
    end
  end

  resources :payment_details do
     member do
        get :delete
    end
  end

  resources :contact_details do
     member do
        get :delete
    end
  end

  resources :employments do
     member do
        get :delete
    end
  end
#   get 'profsign'    => 'professionals#new'

#   get 'compasign' => 'companies#new'

 

   get 'password_resets/new'

   get 'password_resets/edit'






   get   'ulogin'   => 'sessions#new'
   post   'ulogin'   => 'sessions#create'
   delete 'ulogout'  => 'sessions#destroy'

#   # get    'clogin'   => 'sessions#new'
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
