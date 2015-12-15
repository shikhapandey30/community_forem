Rails.application.routes.draw do


  resources :contests
  resources :meeting_rooms
  resources :groups

  resources :friendships
  devise_for :admin

  get 'home/index'


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
  resources :comments do
    resources :likes
    resources :replies, only: [:create, :show]
  end

  resources :replies do
    resources :likes
  end  
  
   resources :topics do
     resources :likes, only: [:create]
    resources :comments
  end
   resources :posts do
    resources :likes, only: [:create]
    resources :dislikes, only: [:create]
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

  resources :profiles do
    collection do
      get :add_education
      get :add_employment
      post :category
      post :education_history, as: :education
      post 'update_education_history/:education_history_id', to: 'profiles#update_education_history', as: :edit_education
      patch 'update_education_history/:education_history_id', to: 'profiles#update_education_history'
      

      post :employment_detail, as: :employment
      post 'update_employment_detail/:employment_detail_id', to: 'profiles#update_employment_detail', as: :edit_employment
      patch 'update_employment_detail/:employment_detail_id', to: 'profiles#update_employment_detail'
      post :skill
    end
  end
  resources :organisations
  resources :communities
  devise_for :users, controllers: { registrations: "registrations" }
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  get 'likes/create'
  # You can have the root of your site routed with "root"
  #users route
   root 'home#index'
   get '/aboutus'=>'home#aboutus'
   get '/contactus'=>'home#contactus'
   get '/help'=>'home#help'
   get '/how_it_work'=>'home#how_it_work'
   get '/privacy_policy'=>'home#privacy_policy'
   get '/terms_and_conditions'=>'home#terms_and_conditions'

   get '/dashboard'=>'users#dashboard'
   get '/auth/:provider/callback', to: 'users#social_login'
   get '/search'=>'users#search'
   get '/search_data'=>'users#search_data'
   post '/user_category', to: 'users#user_category'
   get '/user_category', to: 'users#user_category'
   # get '/followings', to: 'users#followings'
   post '/follow', to: 'users#follow'
   get'followers', to: 'users#followers'
   get'followings', to: 'users#followings'
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
