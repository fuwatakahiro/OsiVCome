Rails.application.routes.draw do
  root to: 'public/homes#top'
  post "/homes/gest_sign_in" => "public/homes#new_gest"
  devise_for :admin,skip: [:registrations, :passwords],controllers: {
  sessions: "admin/sessions"
  }
  devise_for :customers,skip: [:passwords],controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }
 devise_scope  :customer do
    post "/guest_sign_in" => "public/sessions#new_guest"
  end

   scope module: :public do
     get "/genres" => "genres#index"
     resources :contacts, only: [:index, :show, :new, :create] do
       collection do
         post 'confirm'
         post 'back'
       end
     end
     resources :characters, only: [:index, :show] do
       resources :comments, only:[:create, :destroy] do
         resource :favorites, only:[:create, :destroy]
       end
     end
     resources :customers, only: [:index, :show, :edit, :update] do
       resource :relationships, only: [:create, :destroy]
  	   get 'followings' => 'relationships#followings', as: 'followings'
	   get 'followers' => 'relationships#followers', as: 'followers'
     end
     get "/search" => "searches#search"
   end
   namespace :admin do
    root to: "homes#top"
     resources :characters, except: :destroy
     resources :customers, only: [:index, :show, :edit, :update] do
       resources :comments, only: :destroy
     end
     resources :contacts, only: [:index, :update]
     resources :genres, only: [:create, :destroy]
     get "searches" => "searches#search"
   end
end