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
    resources :users
    resources :regions,only: [:index]
    get "search" => "searches#search"
    resources :posts do
      resource :favorites, only: [:create, :destroy]
      resources :comments, only: [:create,:destroy]
    end
  end
  
  
 
 devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
