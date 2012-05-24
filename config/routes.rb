Livescore::Application.routes.draw do
  devise_for :users, :path_names => { :sign_in => 'login', :sign_out => 'logout' }
  
  devise_scope :user do
    get "sign_in", :to => "devise/sessions#new"
  end
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)


  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  namespace :admin do
    match 'schedule', :to => 'tournaments#schedule', :as => 'schedule'
    match 'games', :to => 'tournaments#games', :as => 'games'
    
    resources :tournaments do
      member do
        get :schedule
        get :generate_schedule
        get :games
      end
    end
    resources :poules, :teams, :games
    root :to => 'admin#index'
  end
  
  resources :tournaments do
    member do
      get :ranking
    end
  end
  
  match 'schedule', :to => 'tournaments#show', :as => 'schedule'
  match 'ranking', :to => 'tournaments#ranking', :as => 'ranking'
  match 'finals', :to => 'tournaments#finals', :as => 'finals'
  
  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'dashboard#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
