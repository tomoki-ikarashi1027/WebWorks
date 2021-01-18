class Admins::FrameworkTagsController < ApplicationController
  def create
    @framework = FrameworkTag.new(framework_tags_params)
    if @framework.save
      flash[:notice] = "successfully"
      redirect_to admins_language_tags_path
    else
      @languages = LanguageTag.all
      @frameworks = FrameworkTag.all
      render template: "admins/language_tags/index"
    end
  end

  def destroy
    @framework = FrameworkTag.find(params[:id])
    if @framework.destroy
      redirect_to admins_language_tags_path
    end
  end

  def framework_tags_params
    params.require(:framework_tag).permit(:framework)
  end
end
