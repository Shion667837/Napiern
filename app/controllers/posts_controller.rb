class PostsController < ApplicationController
  before_action :logged_in_user, only: %i[create destroy]

  def home
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @likes_count = Like.where(post_id: @post.id).count
    @comment = Comment.new
    @comments = @post.comments.order(created_at: :desc)
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = '投稿が完了しました'
      redirect_to("/posts/#{@post.id}")
    else
      render 'posts/new'
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:success] = '投稿を削除しました。'
    redirect_to root_path
  end

  def post_ranking
    @rank = Post.find(Like.group(:post_id).order('count(post_id) desc').limit(5).pluck(:post_id))
  end

  def week_ranking
    @rank = Post.find(Like.group(:post_id).where(likes: { created_at: Time.now.all_week }).order('count(post_id) desc').limit(5).pluck(:post_id))
  end

  def month_ranking
    @rank = Post.find(Like.group(:post_id).where(likes: { created_at: Time.now.all_month }).order('count(post_id) desc').limit(5).pluck(:post_id))
  end

  private

  def post_params
    params.require(:post).permit(:name, :body, :price, :place, :user_id, :stockprice, { images: [] })
  end
end
