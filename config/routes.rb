Rails.application.routes.draw do
  
   root 'homes#top'
   
   devise_for :users,skip: [:passwords], controllers: {
   registrations: "public/registrations",
   sessions: 'public/sessions'
 }
 
  scope module: :public do
    resources :users
    resources :regions,only: [:index,:show]
    resources :posts
  end
  
 
 devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
