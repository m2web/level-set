Levelset::Application.routes.draw do
	
	root :to => 'pages#template'

	resources :sessions
		match '/login', :to => 'sessions#new'	

	get "sessions/create"

	get "sessions/destroy"

	resources :users	
 
	resources :user_profiles

	match 'signup' => 'users#signup'

	#this is needed for redirect_to pages_url
	match 'pages' => 'pages#index'

	#this is needed for createUser_url used in the signup.html.erb
	match 'createUser' => 'users#createSignupUser'

	#this is the startTest_url for testing the user. This loads the array of questions
	match 'startTest' => 'users#starttest'

	#this is the actual test question view for the questions
	match 'testQuestion' => 'users#testquestion'

	#this is the strengthsView_url for viewing the strengths
	match 'strengthsView' => 'users#strengthsview'

	#this is the bitMoreInfo_url for viewing of the bit more info view
	match 'bitMoreInfo' => 'users#bitmoreinfo'

	#this is the showMatches_url for viewing of the matches
	match 'showMatches' => 'users#showmatches'

	#this is the showProfile_url for viewing of the matches
	match 'showProfile' => 'users#showprofile'

	#this is the logout_url
	match 'logout' => 'sessions#destroy'

	# The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

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
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
