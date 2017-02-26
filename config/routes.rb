Rails.application.routes.draw do
  devise_for :users, controller: { sessions: 'users/sessions' }
  # root to: "home#index"
  resource :messages do
    collection do
      post 'reply'
    end
  end

  resources :users, :polls, :answers
  resources :votes, only: [:create]

  namespace :api do
    post   'login'   => 'sessions#create'
    delete 'logout'  => 'sessions#destroy'
    get    'verify'  => 'sessions#verify_access_token'
    resources :users, param: :access_token
    resources :password_resets, only: [:new, :create, :edit, :update]
  end
end
