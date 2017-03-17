class CardsController < ApplicationController
  def index
    @consumer = Consumer.find_by(email: "luke@luke.com") #change this to identify current user
    @cards = @consumer.cards
  end

  def show
    @card = Card.find(params[:id])
  end

end
