Rails.application.routes.draw do
  devise_for :users
    resources :skills do
      resources :fundis
    end
    resources :fundis do
      resources :reviews
    end
    root :to => "skills#index"
end
