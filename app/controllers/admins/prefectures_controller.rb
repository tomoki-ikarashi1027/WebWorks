class Admins::PrefecturesController < ApplicationController
  def index
    @company = Company.new
    @prefectures = Prefecture.all
  end

  def show
    @prefecture = Prefecture.find(params[:id])
    @companies = @prefecture.companies
  end


end
