class ResultsController < ApplicationController
  def index
    @shoe = Shoe.find(params[:shoe_id])
    @results = @shoe.results
  end
end