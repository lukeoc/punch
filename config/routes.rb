Rails.application.routes.draw do
  get 'messages/reply'

  get "/" => "consumers#cards"

  get "/cards/:id" => "cards#show"

  get "/signup" => "consumers#new"
  post "/consumers" => "consumers#create"
  get "/consumers/:id" => "consumers#cards"
  get "/consumers/:id/transactions" => "consumers#transactions"
  get "/settings" => "consumers#settings"

  get "/login" => "sessions#new"
  post "/sessions" => "sessions#create"
  get "/logout" => "sessions#destroy"

  namespace :api do
    namespace :v1 do
      get "/cards" => "cards#index"
      get "/cards/:id" => "cards#show"

      get "/consumers" => "consumers#index"
      get "/consumers/:id" => "consumers#show"
    end
  end

resource :messages do
  collection do
    post 'reply'
  end
end

end
