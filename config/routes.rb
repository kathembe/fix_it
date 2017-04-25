Rails.application.routes.draw do
    resources :skills do
      resources :fundis
    end
    resources :fundis do
      resources :reviews
    end
    root :to => "skills#index"
end
