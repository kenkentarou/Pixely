Rails.application.routes.draw do
  root 'posts#index'
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
  resources :users, only: %i[index new create show]
  resources :posts, shallow: true do
    collection do
    get 'like_posts'
    get :search
    end
    resources :comments
    resources :likes, only: %i[create destroy]
  end
  resources :relationships, only: %i[create destroy]
end
