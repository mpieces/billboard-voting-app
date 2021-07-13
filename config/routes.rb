Rails.application.routes.draw do
  devise_for :users
  root "billboards#index"
  
  get "/index", to: "billboards#index"
end
