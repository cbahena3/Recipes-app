Rails.application.routes.draw do
  #recipes model
  get "/recipes" => "recipes#index"
  get "/recipes/:id" => "recipes#show"
  post "/recipes" => "recipes#create"
  patch "/recipes/:id" => "recipes#update"
  delete "/recipes/:id" => "recipes#destroy"

  #users model (signup)
  get "/users" => "users#index"
  post "/users" => "users#create"

  #sessions model (login)
  post "/sessions" => "sessions#create"
end
