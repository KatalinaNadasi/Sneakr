class ShoesController < ApplicationController
  def index
    @brand = Brand.find(params[:brand_id])
    @others_brands = Brand.where.not(id: params[:brand_id])
    # 1 - get list of shoes with brand_id OK
    # 2 - give the list of shoes to the view
    # 3 - show list of models shoes on view
    size = @brand.shoes.size / 3
    @shoes = [@brand.shoes[0...size], @brand.shoes[size...size*2], @brand.shoes[size*2..-1]]
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