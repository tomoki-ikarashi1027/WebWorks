class PostCommentsController < ApplicationController

  def new
    @company = Company.find(params[:company_id])
    @comment = PostComment.new
  end

  def create
    company = Company.find(params[:company_id])
    comment = PostComment.new(post_comment_params)
    comment.company_id = company.id
    if comment.save
      redirect_to company_path(company)
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private
  def post_comment_params
    params.require(:post_comment).permit(:comment, :nick_name, :gender, :employment_status)
  end
end