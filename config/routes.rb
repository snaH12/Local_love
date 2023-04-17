Rails.application.routes.draw do
  
  root 'homes#top'
   
   devise_for :users,skip: [:passwords], controllers: {
   registrations: "public/registrations",
   sessions: 'public/sessions'
 }
 devise_scope :user do
    post 'guests/guest_sign_in', to: 'guests/sessions#guest_sign_in'
  end
 
  scope module: :public do
    get 'users/unsubscribe' => 'users#unsubscribe', as: 'unsubscribe'
    patch 'users/withdrawal' => 'users#withdrawal', as: 'withdrawal'
    
    resources :users do
      get :favorites
    end
    resources :regions,only: [:show]
    get "search" => "searches#search"
    get "search_tag"=>"posts#search_tag"
    
    resources :rooms do
    get "join" => "rooms#join"
    resources :messages, only: [:create]
   end
   
    
    resources :posts do
      resource :favorites, only: [:create, :destroy]
      resources :comments, only: [:create,:destroy]
      collection do
       get 'confirm'
       end
    end
  end
  
  
 
 devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
namespace :admin do
  resources :users, only: [:index, :show, :edit, :update]
  resources :posts, only: [:index, :show, :edit, :update]
  resources :comments, only:[:index,:destroy]
  resources :rooms, only:[:index,:show,:destroy]
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
