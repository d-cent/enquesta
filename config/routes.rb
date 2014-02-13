Enquesta::Application.routes.draw do
  resources :polls, only: [:show, :new, :create], path: 'q' do
    resources :options, only: [:create]
    resources :votes, only: [:create]
  end
  
  root to: "polls#new"
end