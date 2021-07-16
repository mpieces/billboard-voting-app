Rails.application.routes.draw do
  # get 'votes/create'
  # get 'votes/destroy'
  devise_for :users

  root "billboards#index"
  
# post /bilboards/1/vote

  resources :billboards do 
    # collection { post :import }
    member do 
      post 'vote'
    end
  end
end
