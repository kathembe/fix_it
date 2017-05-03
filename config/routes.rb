Rails.application.routes.draw do
  devise_for :users
    resources :skills do
      resources :fundis
    end
    resources :fundis do
      resources :reviews
    end
    resources :fundis do
        member do
        put "like", to: "fundis#upvote"
        put "unlike", to: "fundis#downvote"
      end
    end
    root :to => "skills#index"
end
