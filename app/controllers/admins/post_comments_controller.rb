class Admins::PostCommentsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @reviews = PostComment.all
  end

  def show
    @review = PostComment.find(params[:id])
  end

  def destroy
    review = PostComment.find(params[:id])
      review.destroy
      redirect_to admins_post_comments_path
  end
end
