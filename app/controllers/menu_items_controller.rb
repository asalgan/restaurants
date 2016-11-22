class MenuItemsController < ApplicationController
  before_action :get_restaurant

  def index
    paginate json: @restaurant.menu_items, per_page: 1
  end

  def show
    menu_item = @restaurant.menu_items.find(params[:id].to_i)
    render json: menu_item
  end

  private

    def get_restaurant
      @restaurant = Restaurant.find(params[:restaurant_id].to_i)
    end

end
