Rails.application.routes.draw do
  get "/" => "cards#index"

  get "/signup" => "consumers#new"
  post "/consumers" => "consumers#create"
  get "/consumers/:id" => "consumers#show"
  get "/consumers/:id/cards" => "cards#index"

  get "/login" => "sessions#new"
  post "/sessions" => "sessions#create"

end
