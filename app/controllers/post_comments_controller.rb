class PostCommentsController < ApplicationController
  before_action :set_user

  def new
    @comment = PostComment.new
  end

  def create
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
    @comment = PostComment.find(params[:id])
  end

  def update
    @comment = PostComment.find(params[:id])
    if @comment.update(post_comment_params)
      redirect_to company_path(@company)
    else render :edit
    end
  end

  def destroy
    # @comment = PostComment.find(params[:id])
    # @comment.company_id = @company.id
    # @comment.destroy
    PostComment.find_by(id: params[:id], company_id: params[:company_id]).destroy
    redirect_to company_path(@company)
  end

  private

  def set_user
    @company = Company.find(params[:company_id])
  end

  def post_comment_params
    params.require(:post_comment).permit(:comment, :nick_name, :gender, :employment_status, :score)
  end
end