class CompaniesController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  def index
    @companies = Company.search(params[:search])
  end

  def show
    @company = Company.find(params[:id])
    @reviews = @company.post_comments
  end
end
