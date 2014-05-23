Enquesta::Application.routes.draw do
  resources :polls, only: [:show, :new, :create], path: 'q' do
    resources :votes, only: [:create, :update]
    
    member do
      get :results
    end
  end
  
  root to: "polls#new"
end