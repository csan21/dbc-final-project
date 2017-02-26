Rails.application.routes.draw do

  resource :messages do
    collection do
      post 'reply'
    end
  end

  resources :users do
    resources :polls
  end

  resources :answers
  resources :votes, only: [:create]

  namespace :api do
    post   'login'   => 'sessions#create'
    delete 'logout'  => 'sessions#destroy'
    get    'verify'  => 'sessions#verify_access_token'
    resources :users, param: :access_token
    resources :password_resets, only: [:new, :create, :edit, :update]
  end
end
