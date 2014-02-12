Enquesta::Application.routes.draw do
  resources :polls, only: [:show, :new, :create] do
    resources :options, only: [:create]
  end
  
  root to: "polls#new"
end
