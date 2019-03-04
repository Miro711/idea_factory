Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get "/", to: "ideas#index", as: :root
  resources :users, only: [:new, :create]
  resources :ideas do
    resources :reviews, shallow: true, only: [:create, :destroy]
  end
end
