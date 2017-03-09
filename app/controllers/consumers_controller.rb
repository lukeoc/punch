class ConsumersController < ApplicationController
  def new
  end

  def create
    consumer = Consumer.new(
      name: params[:name],
      email: params[:email],
      phone: params[:phone],
      password: params[:password]
      )
    if consumer.save
      session[:user_id] = consumer.id
      flash[:success] = "welcome to punch!"
      redirect_to "/"
    else
      flash[:warning] = "oops. something didn't work. give it another try."
      redirect_to "/signup"
    end
  end

  def show
    @consumer = Consumer.find(params[:id])
  end

end