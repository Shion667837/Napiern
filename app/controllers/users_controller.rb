class UsersController < ApplicationController

  before_action :logged_in_user, only: [:edit, :update]
  before_action :correct_user, only: [:edit,:update]

  def show
    @user = User.find(params[:id])
    @rooms = @user.rooms
  end


  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.image_name = "default.png"
    if @user.save
      log_in @user
      flash[:success] = "ようこそTravel Appへ！"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if params[:image]
      @user.image_name = "#{@user.id}.png"
      image = params[:image]
      file.binwrite("public/user_images/#{@user.image_name}", image.read)
    end

    if @user.update(user_params)
      flash[:success] = "編集が完了しました"
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :image_name, :body)
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
end
