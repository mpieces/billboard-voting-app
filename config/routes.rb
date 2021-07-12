Rails.application.routes.draw do
  root "welcome#index"
  
  get "/index", to: "welcome#index"
end
