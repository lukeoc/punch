class Api::V1::CardsController < ApplicationController
  def show
    @card = Card.find(params[:id])
    render "show.json.jbuilder"
  end
end
