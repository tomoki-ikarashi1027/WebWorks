class PrefecturesController < Admins::PrefecturesController
  def index
    @languages = LanguageTag.all
    @frameworks = FrameworkTag.all

  end

  def show
    @prefecture = Prefecture.find(params[:id])
    @companies = @prefecture.companies
  end

  def search
    if params[:search].present?
      @companies = Company.search(params[:search])
    elsif params[:language_tag_id].present?
      @companies = LanguageTag.find(params[:language_tag_id]).companies
    else
      @companies = FrameworkTag.find(params[:framework_tag_id]).companies
    end



    # @companies = Company.search(params[:search])

    # if params[:language_tag_id].present?
    #   @select_languages = LanguageTag.find(params[:language_tag_id]).companies
    # else
    #   @select_languages = Company.all
    # end
    # @select_languages = params[:language_tag_id].present? ? LanguageTag.find(params[:language_tag_id]).companies : Company.all

  end
end