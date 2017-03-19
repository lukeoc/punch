Rails.application.routes.draw do
  get "/" => "consumers#cards"
  get "/cards/:id" => "cards#show"

  get "/signup" => "consumers#new"
  post "/consumers" => "consumers#create"
  get "/consumers/:id" => "consumers#show"
  get "/consumers/:id/cards" => "consumers#cards"
  get "/consumers/:id/transactions" => "consumers#transactions"

  get "/login" => "sessions#new"
  post "/sessions" => "sessions#create"

  namespace :api do
    namespace :v1 do
      get "/cards" => "cards#index"
      get "/cards/:id" => "cards#show"

      get "/consumers" => "consumers#index"
      get "/consumers/:id" => "consumers#show"
      get "/consumers/:id/cards" => "consumers#cards"
    end
  end

end
