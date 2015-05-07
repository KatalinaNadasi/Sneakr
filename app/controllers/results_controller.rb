class ResultsController < ApplicationController
  def index
    @shoe = Shoe.find(params[:shoe_id])
    @results = @shoe.results.order("price asc")

    price = params[:price]
    size = params[:size]
    if price && price.present?
      price_array = price.split("-")
      @price_low_range = price_array.first.to_i
      @price_high_range = price_array.last.to_i
      price_range = Range.new(@price_low_range, @price_high_range)
      @results = @results.where(price: price_range.to_a)
    end

    if size
      @results = @results.where("size = ?", size)
    end
  end
end