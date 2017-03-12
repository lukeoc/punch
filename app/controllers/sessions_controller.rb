class SessionsController < ApplicationController
  def new
  end

  def create
    consumer = Consumer.find_by(email: params[:email])
    if consumer && consumer.authenticate(params[:password])
      login(consumer)
      flash[:success] = 'successfully logged in!'
      redirect_to "/consumers/#{consumer.id}/cards"
    else
      flash[:warning] = 'what you have asked for is not possible sorry man'
      redirect_to "/login"
    end
  end
end
