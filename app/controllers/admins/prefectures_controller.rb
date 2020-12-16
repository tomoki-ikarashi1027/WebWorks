class Admins::PrefecturesController < ApplicationController
  def index
  end

  def show
    @prefecture = Prefecture.find(params[:id])
    @companies = @prefecture.companies
    # @tags = @companies.tags
  end

  def destroy
    @prefecture = Prefecture.find(params[:id])
    @company = Company.find(params[:id])
    if@company.destroy
      redirect_to admins_prefecture_path(@prefecture)
    end
  end
end
