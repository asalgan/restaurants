class RestaurantsController < ApplicationController

  def index
    paginate json: Restaurant.all, per_page: 1, :status => 200
  end

  def show
    render json: Restaurant.find(params[:id]), :status => 200
  end

end
