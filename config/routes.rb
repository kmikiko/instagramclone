Rails.application.routes.draw do
  get 'sessions/new'
  root to: 'home#index'
  resources :posts do
    collection do
      post :confirm
    end
  end
  resources :users, only: %i[new create show edit update]
  resources :sessions, only: %i[new create destroy]
  resources :favorites, only: [:create, :destroy]
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
