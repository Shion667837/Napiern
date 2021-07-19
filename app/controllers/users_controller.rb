class UsersController < ApplicationController
  before_action :logged_in_user, only: %i[index edit update following followers]
  before_action :correct_user, only: %i[edit update]

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @users = User.all
    @user = User.find(params[:id])
    @posts = @user.posts
    @likes = Like.where(user_id: @user.id)
    favorites = Favorite.where(user_id: current_user.id).order(created_at: :desc).pluck(:company_id)
    @favorite = Company.find(favorites)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.image_name = 'default.png'
    if @user.save
      log_in @user
      flash[:success] = 'ようこそTravel Appへ！'
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if params[:image]
      @user.image_name = "#{@user.id}.png"
      image = params[:image]
      file.binwrite("public/user_images/#{@user.image_name}", image.read)
    end

    if @user.update(user_params)
      flash[:success] = '編集が完了しました'
      redirect_to @user
    else
      render 'edit'
    end
  end

  def following
    @title = 'フォロー'
    @user  = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = 'フォロワー'
    @user  = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  def likes
    @user = User.find(params[:id])
    @posts = @user.posts
    @likes = Like.where(user_id: @user.id)
    render 'show_likes'
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image_name, :body, :twitter, :facebook, :instagram)
  end

  # ログイン済みユーザーかどうか確認
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = 'ログインしてください'
      redirect_to login_url
    end
  end

  #正しいユーザーかどうか確認
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end
end
