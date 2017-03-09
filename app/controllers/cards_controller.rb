class CardsController < ApplicationController
  def index
    @consumer = Consumer.find(params[:id])
    @cards = @consumer.cards
  end
end
