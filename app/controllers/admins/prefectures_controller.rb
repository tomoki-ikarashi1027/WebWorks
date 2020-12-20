class Admins::PrefecturesController < ApplicationController
  # before_action :authenticate_admin!
  def index
    @languages = LanguageTag.all
    @frameworks = FrameworkTag.all
  end

  def show
    @prefecture = Prefecture.find(params[:id])
    @companies = @prefecture.companies
  end

  def search
    if params[:search].present?
      @companies = Company.search(params[:search])
    elsif params[:language_tag_id].present?
      @companies = LanguageTag.find(params[:language_tag_id]).companies
    else
      @companies = FrameworkTag.find(params[:framework_tag_id]).companies
    end
  end

  def destroy
    @prefecture = Prefecture.find(params[:id])
    @company = Company.find(params[:id])
    if@company.destroy
      redirect_to admins_prefecture_path(@prefecture)
    end
  end
end
