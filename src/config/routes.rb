Rails.application.routes.draw do
 
  resources :enrollments
  resources :contacts
  resources :matter_teacher_students
  resources :matter_teachers
  resources :recommendations
  resources :matters
  resources :area_of_knowledges
  resources :students
  resources :teachers
  
  # rotas personalizadas - Agendamento de Aulas
  get   "/cursos/agendamento/:course_id" => "courses#agendamento"
  post  "/cursos/agendamento/" => "courses#agendamento_save"
  get   "/cursos/:id" => "courses#show"
  get   "/cursos/agendamento/recomendacao/:course_id" => "courses#recomendacao"
  post  "/cursos/agendamento/recomendacao"    => "courses#recomendacao_save"
  
  # reescrita da URL do RESOURCE. Ajuda esconder demais metodos aos conhecedores de REST
  get "/cursos/" => "courses#index"
  resources :courses 
  
  # Rota para o perfil do usuário.
  get   "/meuperfil" => "users#meuperfil"

  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users
  
  # paginas personalizadas
  get "/pages/como-funciona" => "pages#funcionamento"
  get "/pages/sobre" => "pages#sobre"
  get "/pages/termos" => "pages#termos"
  
  resources :pages
  
  root 'pages#index'
  # devise_for :users, controllers: {reinforcements: "reinforcements"}
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
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
