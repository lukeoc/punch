class Api::V1::ConsumersController < ApplicationController
  def index
    @consumers = Consumer.all
    render "index.json.jbuilder"
  end

  def show
    @consumer = Consumer.find(params[:id])
    render "show.json.jbuilder"
  end
end
