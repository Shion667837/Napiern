class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :search_item
  

  def search
    @results = @search.result
  end

  private
    def search_item
      @search = Room.ransack(params[:q])
    end

    def logged_in_user
      unless logged_in?
        flash[:danger] = "ログインしてください"
        redirect_to login_url
      end
    end
end
