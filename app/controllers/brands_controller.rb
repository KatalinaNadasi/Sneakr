class BrandsController < ApplicationController
  def index
    @brands = Brand.all
    # 1 - get list of all brands OK
    # 2 - give brand's list to the view OK
  end
end
