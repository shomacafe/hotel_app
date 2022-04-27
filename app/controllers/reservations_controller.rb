class ReservationsController < ApplicationController
  
        # ログイン済ユーザーのみにアクセスを許可する
        before_action :authenticate_user!
  def index
    @reservations = Reservation.all
    @reservations = current_user.reservations
  end

  def new
    @reservation = Reservation.new
  end

  def confirm
    @reservation = Reservation.new(reservation_params)
    if @reservation.valid? # バリデーションを手動でチェック
      @reservation.total_price = (@reservation.end_date - @reservation.start_date).to_int * @reservation.number_of_people * @reservation.price
      render "reservations/confirm"
    else
      @room = Room.find(@reservation.room_id)
      render 'rooms/show'
    end
  end

  def create
    @reservation = Reservation.new(reservation_params)

    if @reservation.save
      flash[:notice] = "予約完了しました"
      redirect_to reservation_path(@reservation)
    else
      redirect_to root_path
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to :reservations
  end

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :number_of_people, :room_id, :user_id, :price, :total_price)
  end
end