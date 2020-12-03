class PrefecturesController < Admins::PrefecturesController
  def index
  end

  def show
    @prefecture = Prefecture.find(params[:id])
    @companies = @prefecture.companies
  end
end
