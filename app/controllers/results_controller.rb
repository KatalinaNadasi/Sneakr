class ResultsController < ApplicationController
  def index
    @shoe = Shoe.find(params[:shoe_id])
    @results = @shoe.results.order("price asc")
  end
end