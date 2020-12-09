class Admins::CompaniesController < ApplicationController
  def index
  end
  def show
    @company = Company.find(params[:id])
  end

  def new
    @company = Company.new
  end

  def create
    company = Company.new(company_params)
    if company.save
      flash[:notice] = 'successfully'
      redirect_to admins_prefectures_path
    end
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    company = Company.find(params[:id])
    if company.update(company_params)
      redirect_to  admins_company_path(company.id)
    end

  end
  def destroy
    @company = Company.find(params[:id])
    if @company.destroy
      redirect_to admins_prefecture_path(@company.prefecture_id)
    end
  end

  private
  def company_params
    params.require(:company).permit(:company_name, :description, :image, :prefecture_id, :address, :phone_number, :url)
  end
end
