class Admins::PostCommentsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @reviews = PostComment.all
  end

  def show
    @review = PostComment.find(params[:id])
  end

  # def destroy
  #   review = PostComment.find(params[:id])
  #   if
  #     review.destroy
  #     redirect_to admins_post_comments_path
  #   end
  # end

  def destroy
    review = PostComment.find(params[:id])
      review.destroy
      redirect_to admins_post_comments_path
  end

  # def destroy
  #   @company = Company.find(params[:company_id])
  #   PostComment.find_by(id: params[:id], company_id: params[:company_id]).destroy
  #   redirect_to admins_company_path(@company)
  # end
end
