Rails.application.routes.draw do

  get 'panel/exam/:id'=>'panel#exam',as:"panel_exam"
  post 'panel/exam/:id'=>'panel#check'
  get 'panel/index'

  get 'panel/taken'

  get 'panel/untaken'

  get 'panel/info'

  get '/' => 'index#index',as:"index"
  post 'index/create'

  post '/' =>'index#new'
  delete '/exit' => 'index#destroy'


  resources :exams
  get "exams/optbox/:id"=>'exams#optbox',as:"exam_optbox"
  resources :questions

  resources :students

  controller :sessions do
    get "login"=>'sessions#new'
    post 'login' =>'sessions#create'
    delete 'logout'=>"sessions#destroy"
  end


  get 'admin/index'
  get 'admin/' => 'admin#index'
  resources :teachers

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
