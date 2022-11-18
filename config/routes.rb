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
  devise_scope  :admin do
    post "/admin/guest_sign_in" => "admin/sessions#new_guest"
  end

   scope module: :public do
     resources :contacts, only: [:new, :create]
     post 'contacts/confirm', to: 'contacts#confirm', as: 'confirm'
     post 'contacts/back', to: 'contacts#back', as: 'back'
     get 'done', to: 'contacts#done', as: 'done'
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
     resources :characters, except: :destroy
     resources :customers, only: [:index, :show, :edit, :update]
     resources :genres, only: [:create, :destroy]
   end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end