class SessionsController < ApplicationController
  def new
  end

  def create
    consumer = Consumer.find_by(params[:email])
    if consumer && consumer.authenticate(params[:password])
      login(consumer)
      redirect_to "/consumers/:id/cards"
    else
      redirect_to "/login"
    end
  end
end
