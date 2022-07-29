Rails.application.routes.draw do
  # devise_for :users
  # devise_scope :user do
  #   get '/users/sign_out' => 'devise/sessions#destroy'
  # end
  #     #resources :posts
  # root "users#index"

  # resources :users, only: %i[index show] do
  #   resources :posts do
  #     resources :comments, only: %i[new create destroy]
  #     resources :likes, only: %i[create new]
  #   end
  # end

  # API Routes
  get '/api/users/:user_id/posts', to: 'api_endpoints#user_posts', as: 'api_user_posts'
  get '/api/users/:user_id/posts/:post_id/comments', to: 'api_endpoints#user_post_comments', as: 'api_posts_comments'
  post '/api/users/:user_id/posts/:post_id/comments', to: 'api_endpoints#new_comment', as: 'new_post_comment'
end
