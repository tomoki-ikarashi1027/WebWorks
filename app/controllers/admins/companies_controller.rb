class Admins::CompaniesController < ApplicationController
  def index

  end
  def show

  end

  def create
    @prefecture = Prefecture.find(params[:id])
    company = Company.new(company_params)
    company.prefecture_id = @prefecture.id
    if company.save
      lash[:notice] = 'successfully'
      redirect_to admins_prefectures_path
    end

  end

  def edit

  end
  def updata

  end
  def destroy

  end

  private
  def company_params
    params.require(:company).permit(:company_name, :description, :image)
  end
end
