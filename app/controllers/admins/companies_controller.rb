class Admins::CompaniesController < ApplicationController
  before_action :set_user, except:[:new, :create, :index]
  # before_action :language_string, only: [:create, :update]
  def index
    @comments = PostComment.all
  end
  def show
    @reviews = @company.post_comments
  end

  def new
    @company = Company.new
  end

  def create
    # params[:company][:language] = params[:company][:language].join
    company = Company.new(company_params)
    if company.save
      # binding.pry
      flash[:notice] = 'successfully'
      redirect_to admins_prefectures_path
    end
  end

  def edit
  end

  def update
    company = Company.find(params[:id])
    if company.update(company_params)
      redirect_to  admins_company_path(company.id)
    end

  end
  def destroy
    if @company.destroy
      redirect_to admins_prefecture_path(@company.prefecture_id)
    end
  end

  private

  def set_user
    @company = Company.find(params[:id])
  end

  def language_string
    params[:company][:language] = params[:company][:language].to_s  # to string
  end

  def company_params
    params.require(:company).permit(:company_name, :description, :image, :prefecture_id, :address, :phone_number, :url, language: [])
  end
end
