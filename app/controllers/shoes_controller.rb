class ShoesController < ApplicationController
  def index
    @brands = Brand.all
    @brand = Brand.find(params[:brand_id])
    # 1 - get list of shoes with brand_id OK
    # 2 - give the list of shoes to the view with @ OK
    # 3 - show list of models shoes on view
    size = @brand.shoes.size / 3
    size = size.round(0)
    @shoes = [@brand.shoes[0...size], @brand.shoes[size...size*2], @brand.shoes[size*2...-1]]
  end

  def results
    selected_shoe_id = params[:shoe_id]
    selected_size    = params[:size]
    shoes = Shoe.find(params[:shoe_id])
    @results = shoes.results

    # 1 - get list of results with shoe_id
    # 1 - if size is selected => search "results" with size = X
    # 2 - give the list of shoes to the view with @
    # 3 - show list on view + show filters (search engine)
  end
end