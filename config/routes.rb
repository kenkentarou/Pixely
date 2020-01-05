Rails.application.routes.draw do
  root 'posts#index'
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
  resources :users, only: %i[index new create show]
  resources :posts, shallow: true do
    get 'like_posts', on: :collection
    resources :comments
    resources :likes, only: %i[create destroy]
  end
  resources :relationships, only: %i[create destroy]
end
