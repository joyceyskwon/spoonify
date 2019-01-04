class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def new
    @reservation = Reservation.new
    @restaurants = Restaurant.all
  end

  def create
    @reservation = Reservation.create(reservation_params)
    @restaurants = Restaurant.all
    if @reservation.valid?
      flash[:notice] = "Success! Your reservation for #{@reservation.restaurant.name.capitalize} is made on #{@reservation.date_time}."
      redirect_to reservations_path
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
    redirect_to reservations_path
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @restaurant = Restaurant.find(params[:id])
    @reservation.destroy
    redirect_to reservations_path
  end

  private

  def reservation_params
    params.require(:reservation).permit(:restaurant_id, :date_time, :num_of_people, :user_id)
  end

end # end of ReservationsController
