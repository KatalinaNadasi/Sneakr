class IndexController < ApplicationController
  def brands
    # 1 - get list of all brands
    # 2 - give brand's list to the view
    # 3 - show list in view
  end

  def shoes
    selected_brand_id = params[:brand_id]
    # 1 - get list of shoes with brand_id
    # 2 - give the list of shoes to the view with @
    # 3 - show list on view
  end

  def results
    selected_shoe_id = params[:shoe_id]
    selected_size    = params[:size]
    # 1 - get list of results with shoe_id
    # 1' - if size is selected => search "results" with size = X
    # 2 - give the list of shoes to the view with @
    # 3 - show list on view + show filters (search engine)


  end
end
