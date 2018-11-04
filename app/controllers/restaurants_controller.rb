class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:new, :index]
  def index
    @restaurants = Restaurant.all
  end

  def new
    @categories = Restaurant::CATEGORIES
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :category, :phone_number, :address)
  end

  def set_restaurant
    @restaurant = Restaurant.new
  end
end
