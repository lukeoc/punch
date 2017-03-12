class CardsController < ApplicationController
  def index
    @consumer = Consumer.find_by(email: "luke@luke.com")
    @cards = @consumer.cards
  end

  def show
    @card = Card.find(params[:id])
  end

end
