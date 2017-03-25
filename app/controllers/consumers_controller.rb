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
      redirect_to "/consumers/#{consumer.id}/cards"
    else
      flash[:warning] = "oops. something didn't work. give it another try."
      redirect_to "/signup"
    end
  end

  def show
    @consumer = Consumer.find(params[:id])
  end

  def cards
    # @consumer = Consumer.find(params[:id])
    @consumer = current_consumer
    @consumer.cards.each do |card|
      card.total = card.current_total
      if card.total > card.merchant.reward_threshold
        card.redeemable = true
      end
      card.save
    end
    @consumer.cards_redeemable?
    render "cards.html.erb"
  end

  def transactions
    @consumer = Consumer.find(params[:id])
    render "transactions.html.erb"
  end

  def setttings
    @consumer = current_consumer
    render "settings.html.erb"
  end

end
