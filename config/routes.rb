Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # Don't know why this is here?
  # root to: "home#index"

  resource :messages do
    collection do
      post 'reply'
    end
  end


end
