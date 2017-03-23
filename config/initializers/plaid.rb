Plaid.config do |p|
  p.client_id = ENV["PLAID_CLIENT_ID"]
  p.secret = ENV["PLAID_SECRET_KEY"]
  p.env = :development  # or :production
end