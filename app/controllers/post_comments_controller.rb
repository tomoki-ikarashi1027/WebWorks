class PostCommentsController < ApplicationController

  def new
    @company = Company.find(params[:company_id])
    @comment = PostComment.new
  end

  def create
    @company = Company.find(params[:company_id])
    @comment = PostComment.new(post_comment_params)
    @comment.user_id = current_user.id
    @comment.company_id = @company.id
    if @comment.save
      redirect_to company_path(@company)
    else
      render :new
    end
  end

  def edit
    @company = Company.find(params[:company_id])
    @comment = PostComment.find(params[:id])
  end

  def update
    @company = Company.find(params[:company_id])
    @comment = PostComment.find(params[:id])
    if @comment.update(post_comment_params)
      redirect_to company_path(@company)
    else render :edit
    end
  end

  def destroy
    @company = Company.find(params[:company_id])
    # @comment = PostComment.find(params[:id])
    # @comment.company_id = @company.id
    # @comment.destroy
    PostComment.find_by(id: params[:id], company_id: params[:company_id]).destroy
    redirect_to company_path(@company)
  end

  private
  def post_comment_params
    params.require(:post_comment).permit(:comment, :nick_name, :gender, :employment_status, :score)
  end
end