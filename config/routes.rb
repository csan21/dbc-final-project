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
end
