class DashboardsController < ApplicationController
  def index
    @dashboards = Dashboard.where(user_id: current_user.id)
  end

  def show
    @dashboard = Dashboard.find(params[:id])
  end

  def new
    @dashboard = current_user.dashboards.build
  end

  def create
    @dashboard = current_user.dashboards.build(dashboard_params)
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
    @dashboard.update(dashboard_params)
    if @dashboard.save
      redirect_to dashboards_path
    else
      render 'edit'
    end  end

  def destroy
    @dashboard = Dashboard.find(params[:id])
    @dashboard.destroy
    redirect_to dashboards_path
  end

  private

  def dashboard_params
    params.require(:dashboard).permit(:title, :body)
  end
end
