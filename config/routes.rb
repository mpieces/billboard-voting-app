Rails.application.routes.draw do
  # get 'votes/create'
  # get 'votes/destroy'
  devise_for :users

  root "billboards#index"
  
  resources :billboards do 
    resources :votes
    # collection { post :import }
    # member do 
    #   post 'upvote'
    # end
  
  end
end
