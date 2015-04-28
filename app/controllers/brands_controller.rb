class BrandsController < ApplicationController
  def index
    @brands = Brand.all
    # 1 - get list of all brands OK
    # 2 - give brand's list to the view OK

    # 3 - show list in view / go to view show.html.erb
  end
end
