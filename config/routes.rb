Rails.application.routes.draw do
  resources :pins do 
    resources :comments, only: [:create]
  end

  namespace 'api' do 
    namespace 'v1' do 
      resources :pins
    end
  end

  devise_for :users
  root "pins#index" 
  get "about" => "pages#about#"
  get "mission" => "pages#mission"
  get "profile/:id" => "profile#show", as: :profile
  get "follow/user/:id" => "profile#follow", as: :follow_user
  get "unfollow/user/:id" => "profile#unfollow", as: :unfollow_user
  get "like/pin/:id" => "pins#like" , as: :like_pin 
  get "unlike/pin/:id" => "pins#unlike" , as: :unlike_pin 

end
