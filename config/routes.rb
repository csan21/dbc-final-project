Rails.application.routes.draw do
  devise_for :users
  # root to: "home#index"
  resource :messages do
    collection do
      post 'reply'
    end
  end

  resources :users, :polls, :answers, :votes only: [:create]
end
