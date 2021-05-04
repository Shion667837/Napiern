class RoomsController < ApplicationController

  before_action :logged_in_user, only: [:create, :destroy]


  def home
  end

  def index
    #@q = Room.ransack(params[:q])
    #@rooms = @q.result(distinct: true).includes(:user).order(created_at: :desc)
    @rooms = Room.all
  end

  def new
    @room = Room.new
    @reservation = Reservation.new
  end

  def show
    @room = Room.find(params[:id])
    @user = @room.user
    @reservation = Reservation.new
  end

  def create
    @room = current_user.rooms.build(room_params)
    if @room.save
      flash[:success] = "登録が完了しました"
      redirect_to("/rooms/#{@room.id}")
    else
      render 'rooms/new'
    end
  end

  #def search
    #@results = @search.result
  #end

  private
    def room_params
      params.require(:room).permit(:name, :body, :price, :place, :user_id, :img)
    end

    #def search_item
      #@search = Room.ransack(params[:q])
    #end

end
