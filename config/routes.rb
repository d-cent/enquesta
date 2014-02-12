Enquesta::Application.routes.draw do
  resources :polls, only: [:show]
end
