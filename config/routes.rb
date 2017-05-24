Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'users#index'
  resources :course_histories
  resources :reports
  resources :students do
    resources :reports
  end
  resources :faculty
  resources :degrees
  resources :courses
  
  get '/reports/:id', to: 'reports#show', as: :show_report
  get '/login', to: 'sessions#new', as: :login
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: :logout
  get '/register', to: 'users#new', as: :new_account
  post '/register', to: 'users#create'
  get '/settings' => 'users#edit', as: :settings
  patch '/users/:id', to: 'users#update', as: :user
  delete '/users/:id', to: 'users#destroy'
  
  # get '/faculty', to: 'faculty#index', as: :faculty
  # get '/faculty/:id', to: 'faculty#show', as: :user
  # get '/students', to: 'users#students', as: :students_index
  get '/users', to: 'users#all_users', as: :users
  # get '/students/:student_id', to: 'users#show', as: :student
  # get '/students/:student_id/reports', to: 'reports#index', as: :student_reports
  # get '/students/:student_id/reports/:report_id', to: 'reports#show', as: :student_report
  

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
