class Admins::PostCommentsController < ApplicationController
  def index
  end
  def destroy
    @company = Company.find(params[:company_id])
    PostComment.find_by(id: params[:id], company_id: params[:company_id]).destroy
    redirect_to admins_company_path(@company)
  end
end
