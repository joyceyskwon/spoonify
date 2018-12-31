class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
    @lists = List.all
  end

  def create
    @restaurant = Restaurant.create(restaurant_params)
    @lists = List.all
    if @restaurant.valid?
      flash[:notice] = 'You have successfully enlisted a restaurant!'
      redirect_to @restaurant
    else
      flash[:notice] = 'Ooops! Please try again.'
      render :new
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
    @lists = List.all
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    @lists = List.all
    @restaurant.update_attributes(restaurant_params)
    if @restaurant.valid?
      flash[:notice] = 'You have successfully updated a restaurant!'
      redirect_to @restaurant
    else
      flash[:notice] = 'Ooops! Please try again.'
      render :edit
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to restaurants_path
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:list_id, :name, :lat, :lng, :yelp_url)
  end

end # end of RestaurantsController
