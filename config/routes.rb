Enquesta::Application.routes.draw do
  resources :polls, only: [:show, :new, :create]
  
  root to: "polls#new"
end
