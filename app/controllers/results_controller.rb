class ResultsController < ApplicationController
  def index
    @shoe = Shoe.find(params[:shoe_id])
    @results = @shoe.results.order("price asc")

    price = params[:amount]
    size = params[:size]
    if price && price.present?
      @results = @results.where("price <= ?", price.to_f)
    end

    if size
      @results = @results.where("size = ?", size)
    end
  end
end