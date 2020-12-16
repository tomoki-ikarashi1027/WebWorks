class Admins::TagsController < ApplicationController
  def index
    @tags = Tag.all
    @tag = Tag.new
  end
  def edit

  end

  def create
    @tag = Tag.new(tags_params)
    if @tag.save
      redirect_to admins_tags_path
    else
      render :index
    end
  end

  def upadate

  end

  def destroy

  end

  private

  def tags_params
    params.require(:tag).permit(:language, :framework)
  end
end
