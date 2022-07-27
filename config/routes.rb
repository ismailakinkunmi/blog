Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
      #resources :posts
  root "users#index"

  resources :users, only: %i[index show] do
    resources :posts do
      resources :comments, only: %i[new create destroy]
      resources :likes, only: %i[create new]
    end
  end
end
