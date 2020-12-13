class CompaniesController < ApplicationController
  def index
    @companies = Company.search(params[:search])
  end

  def show
    @company = Company.find(params[:id])
    @reviews = @company.post_comments
  end

  def edit
  end

  def updata
  end

  def destroy

  end
end
