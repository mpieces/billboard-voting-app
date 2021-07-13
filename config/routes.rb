Rails.application.routes.draw do
  devise_for :users
  root "billboards#index"
  
  get "/index", to: "billboards#index"

  resources :billboards do 
    member do 
      post 'upvote'
    end
    # collection { post :import }
  end
end
