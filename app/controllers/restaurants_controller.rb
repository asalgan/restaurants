class RestaurantsController < ApplicationController

  def index
    paginate json: Restaurant.all, per_page: 1
  end

  def show
    render json: Restaurant.find(params[:id])
  end

end
