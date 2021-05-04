class ReservationsController < ApplicationController

  def index
    @reservations = Reservation.all
    @rooms = Room.all
  end

  def new
    @reservation = Reservation.new
    @room = Room.find(params[:id])
  end

  def confirm
    @reservation = Reservation.new(reservation_params)
    @reservation.user_id = current_user.id
    @room = Room.find(params[:id])
    @reservation.room_id = @room.id
    @price = @room.price
    @reservation.room_name = @room.name
    @reservation.room_img = @room.img
    @reservation.room_body = @room.body
    @reservation.total_price = @room.price * @reservation.people * (@reservation.end_date.to_date - @reservation.start_date.to_date).to_i
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user_id = current_user.id
    if @reservation.save
      flash[:success] = "ルームを予約しました"
      redirect_to reservation_path(@reservation.id)
    else
      render :confirm
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
  end


  private

    def reservation_params
      params.require(:reservation).permit(:user_id, :room_id, :room_name, :room_img, :room_body, :start_date, :end_date, :total_price, :people)
    end

end
