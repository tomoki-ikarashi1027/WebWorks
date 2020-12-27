class Admins::LanguageTagsController < ApplicationController
  def index
    @languages = LanguageTag.all
    @frameworks = FrameworkTag.all
    @language = LanguageTag.new
    @framework = FrameworkTag.new
  end

  def create
    @language = LanguageTag.new(language_tags_params)
    if @language.save
      redirect_to admins_language_tags_path
    else
    @languages = LanguageTag.all
    @frameworks = FrameworkTag.all
      render :index
    end
  end

  def destroy
    @language = LanguageTag.find(params[:id])
    if @language.destroy
      redirect_to admins_language_tags_path
    end
  end

  private

  def language_tags_params
    params.require(:language_tag).permit(:language)
  end
end
