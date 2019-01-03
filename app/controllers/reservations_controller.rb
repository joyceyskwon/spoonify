class ReservationsController < ApplicationController
  def show
    @reservation = Reservation.find(params[:id])
  end

  def new
    @reservation = Reservation.new
    @restaurant = Restaurant.find(params[:id])
  end

  def create
    @reservation = Reservation.create(reservation_params)
    @restaurant = Restaurant.find(params[:id])
    if @reservation.valid?
      redirect_to @reservation
    else
      flash[:notice] = "Woops, please try again!"
      render :new
    end
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def update
    @reservation = Reservation.find(params[:id])
    @reservation.update_attributes(reservation_params)
    redirect_to @reservation
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @restaurant = Restaurant.find(params[:id])
    @reservation.destroy
    redirect_to restaurant_path(@restaurant)
  end

  private

  def reservation_params
    params.require(:reservation),permit(:restaurant_id, :date, :time, :num_of_people)
  end

end # end of ReservationsController
