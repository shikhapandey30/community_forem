Rails.application.routes.draw do
  
  get 'payment_details/express'
  get 'payment_details/create'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :user_skills
  resources :forums  do
     resources :comments
  end
  resources :forum_polls do
    resources :votes, only: [:create]
  end
  resources :comments
  
   resources :topics do
     resources :likes, only: [:create]
    resources :comments
  end
   resources :posts do
    resources :likes, only: [:create]
    resources :comments
  end
   resources :conversations do
    resources :messages
  end
  # resources :users do
  # resources :notifications, only: [:create]  
  # end
  resources :employment_details
  resources :categories
  resources :education_histories
  resources :specializations
  resources :profiles
  devise_for :admin_users, ActiveAdmin::Devise.config
  # ActiveAdmin.routes(self)
  resources :organisations
  devise_for :users, controllers: { registrations: "registrations" }
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  get 'likes/create'
  # You can have the root of your site routed with "root"
  #users route
   root 'users#index'
   get '/dashboard'=>'users#dashboard'
   get '/auth/:provider/callback', to: 'users#social_login'
   get '/search'=>'users#search'
   get '/search_data'=>'users#search_data'
   post '/user_category', to: 'users#user_category'
   get '/user_category', to: 'users#user_category'
   get '/followings', to: 'users#followings'
   post '/follow', to: 'users#follow'
   get'follwers', to: 'users#followers'
   get'follwings', to: 'users#followings'
   get '/notification_count', to: 'users#notification_count'
   get '/reveal_identity', to: 'users#reveal_identity'
   #forums route
    get '/manage_forum'=>'forums#manage_forum'
    get '/manage_skill'=>'skills#manage_skill'
   
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
