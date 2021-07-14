Rails.application.routes.draw do
  get 'votes/create'
  get 'votes/destroy'
  devise_for :users
  root "billboards#index"
  
  get "/index", to: "billboards#index"

  resources :billboards do 
    resources :votes
    # member do 
    #   post 'upvote'
    # end
    # collection { post :import }
  end
end
