class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def index
    @dashboards = Dashboard.where(user_id: current_user.id).order(:sort)
  end

  def show
    @dashboard = Dashboard.find(params[:id])
  end

  def new
   @dashboard = current_user.dashboards.build
  end

  def create
    #    render plain: params[:post].inspect
    @dashboard = current_user.dashboards.build(dashboard_params_create)
    if @dashboard.save
      redirect_to dashboards_path
    else
      render 'new'
    end
  end

  def edit
    @dashboard = Dashboard.find(params[:id])
  end

  def update
    @dashboard = Dashboard.find(params[:id])
    @dashboard.update(dashboard_params_uptade)
    if @dashboard.save
      redirect_to dashboard_path
    else
      render 'edit'
    end  end

  def destroy
    @dashboard = Dashboard.find(params[:id])
    @dashboard.destroy
    redirect_to dashboards_path
  end

  private

  def dashboard_params_create
    dashboard_qnty = current_user.dashboards.count
    params.require(:dashboard).permit(:title, :body).merge!({sort: dashboard_qnty})
  end

  def dashboard_params_uptade
    params.require(:dashboard).permit(:title, :body)
  end
end
