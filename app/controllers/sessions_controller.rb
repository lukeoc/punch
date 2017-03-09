class SessionsController < ApplicationController
  def new
  end

  def create
    consumer = Consumer.find_by(email: params[:email])
    if consumer && consumer.authenticate(params[:password])
      session[:consumer_id] = consumer.id
      flash[:success] = 'successfully logged in!'
      redirect_to "/"
    else
      flash[:warning] = 'what you have asked for is not possible sorry man'
      redirect_to "/login"
    end
  end
end
