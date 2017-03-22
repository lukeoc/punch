class CardsController < ApplicationController
  def index
    @consumer = Consumer.find_by(email: "luke@luke.com") #change this to identify current user
    @cards = @consumer.cards
  end

  def show
    @card = Card.find(params[:id])
    @card.update_attribute("total", @card.current_total)
    @current_total = @card.current_total
  end

end
