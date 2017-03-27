require 'rubygems'
require 'twilio-ruby'



account_sid = "SK80e3326a3163a84940b1b520e2270c83"
auth_token = "3277fcc552d3b025226a993bfa722f78"

  client = Twilio::REST::Client.new account_sid, auth_token

  client.messages.create(
    to: "+15742765882",
    from: "+15744060358",
    body: "hello world"
    )