class DashboardsController < ApplicationController
  before_action :authenticate_user!
  def index
    @dashboards = Dashboard.where(user_id: current_user.id).order(:sort)
  end

  def show
    @dashboard = Dashboard.find(params[:id])
    render 'pages/index.html.erb' if current_user.id != @dashboard.user_id
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
    render 'pages/index.html.erb' if current_user.id != @dashboard.user_id
  end

  def update
    @dashboard = Dashboard.find(params[:id])
    @dashboard.update(dashboard_params_update)
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



  def dashboard_params_create
    dashboard_qnty = current_user.dashboards.count
    sort = dashboard_qnty == 0? 0: current_user.dashboards.maximum(:sort) + 1
    params.require(:dashboard).permit(:title, :body).merge!({sort: sort})
  end

  def dashboard_params_update
    params.require(:dashboard).permit(:title, :body)
  end
end
