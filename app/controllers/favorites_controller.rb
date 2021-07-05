class FavoritesController < ApplicationController
  def index
    @favorite_companies = current_user.favorite_companies
  end

  def create
    @company = Company.find(params[:company_id])
    if @company.user_id != current_user.id
      @favorite = Favorite.create(user_id: current_user.id, company_id: @company.id)
    end
  end

  def destroy
    @company = Company.find(params[:company_id])
    @favorite = Favorite.find_by(user_id: current_user.id, company_id: @company.id)
    @favorite.destroy
  end
end
