class SessionsController < ApplicationController
  def new
    render "new.html.erb"
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

  def destroy
    session[:consumer_id] = nil
    flash[:success] = 'Successfully logged out!'
    redirect_to '/login'
  end
end
