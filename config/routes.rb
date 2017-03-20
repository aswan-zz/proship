Rails.application.routes.draw do
  resources :messages
  resources :reminders
  resources :reminder_types
  resources :meeting_members
  resources :meetings
  resources :meeting_types
  resources :roles
  resources :contracts
  resources :contract_statuses
  resources :gigs
  resources :ranks
  resources :chairs
  resources :rooms
  resources :ships
  resources :cruise_lines
  resources :availabilities
  resources :availability_types
  resources :airports
  resources :state_provs
  resources :countries
  resources :notes
  resources :note_types
  resources :photos
  resources :members
  
  get '/', to: 'members#home', as: 'home'
  get '/admin', to: 'members#admin', as: 'admin'
  get '/logout', to: 'members#logout', as: 'logout'
  post '/login', to: 'members#login', as: 'login'
  post '/register' => 'members#register', as: 'register'
  
  get 'search/members', to: 'members#search', as: 'members_search'
  get 'members/:id/notes', to: 'notes#member_notes', as: 'member_notes'
  
  get 'messages/:id/reply/new', to: 'messages#new_reply', as: 'messages_reply'
  get 'messages/to/:id', to: 'messages#messages_to', as: 'messages_to'
  get 'messages/to/:id/from', to: 'messages#my_messages_to', as: 'my_messages_to'
  get 'messages/from/:id', to: 'messages#messages_from', as: 'messages_from'
  get 'messages/from/:id/to', to: 'messages#my_messages_from', as: 'my_messages_from'
  post 'messages/:id/reply/create', to: 'messages#create_reply', as: 'messages_create_reply'
  
  get 'members/:id/availabilities', to: 'availabilities#member_availabilities', as: 'member_availabilities'
  
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
