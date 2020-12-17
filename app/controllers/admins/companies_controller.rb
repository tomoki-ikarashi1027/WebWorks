class Admins::CompaniesController < ApplicationController
  before_action :set_user, except:[:new, :create, :index]
  def index
    @comments = PostComment.all
  end
  def show
    @reviews = @company.post_comments
  end

  def new
    @languages = LanguageTag.all
    @frameworks = FrameworkTag.all
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      flash[:notice] = 'successfully'
      redirect_to admins_prefectures_path
    else
      @languages = LanguageTag.all
      @frameworks = FrameworkTag.all
      render :new
    end
  end

  def edit
  end

  def update
    @prefecture = Prefecture.find(params[:id])
    @company = Company.find(params[:id])
    if @company.update(company_params)
      redirect_to admins_prefecture_path(@prefecture)
    else
      render :edit
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

  def company_params
    params.require(:company).permit(:company_name, :description, :image, :prefecture_id, :address, :phone_number, :url, language_tag_ids: [], framework_tag_ids: [])
  end
end
