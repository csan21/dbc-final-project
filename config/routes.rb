Rails.application.routes.draw do
  # root to: "home#index"
  resource :messages do
    collection do
      post 'reply'
    end
  end

  resources :users, :polls, :answers
  resources :votes, only: [:create]
end
