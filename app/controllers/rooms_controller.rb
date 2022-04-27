class RoomsController < ApplicationController
  
      # ログイン済ユーザーのみにアクセスを許可する
      before_action :authenticate_user!
  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(params.require(:room).permit(:name, :introduction, :price, :adress, :picture, :user_id))
    @room.user = current_user
    if @room.save
      flash[:notice] = "部屋を新規登録しました"
      redirect_to :posts_rooms
    else
      render "new"
    end
  end

  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    flash[:notice] = "ルーム情報を削除しました"
    redirect_to :posts_rooms
  end

  def posts
    @rooms = current_user.rooms
  end

  def search
    @keyword = params[:keyword]
    @area = params[:area]
    if params[:keyword] != nil
      @rooms = Room.where(["name Like? OR adress Like? OR introduction Like?", "%#{@keyword}%", "%#{@keyword}%", "%#{@keyword}%"])
    elsif params[:area] != nil
      @rooms = Room.where(["adress Like?", "%#{@area}%"])
    else
      @rooms = Room.all
    end
    render "index"
  end



end
