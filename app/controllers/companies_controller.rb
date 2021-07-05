class CompaniesController < ApplicationController

  def index
    @companies = Company.all
  end

  def show
    @company = Company.find(params[:id])
  end

  private

  def company_params
    params.require(:company).permit(:user_id, :post_id, :coop_name, :coop_body, :coop_place, :coop_image)
  end
end
