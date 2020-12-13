class PrefecturesController < Admins::PrefecturesController
  def index
    @companies = Company.search(params[:search])
  end

  def show
    @prefecture = Prefecture.find(params[:id])
    @companies = @prefecture.companies
  end

end
