class Admin::DashboardController < Admin::BaseController
  before_action :require_admin

  def index
    @user = User.all
  
  end

  def approve
    user = User.find(params[:id])
    user.update!(status: 'approved')
    flash[:success] = "Agent has been approved"
    redirect_to admin_dashboard_index_path
  end

  def reject
    user = User.find(params[:id])
    user.update!(status: 'rejected')
    flash[:success] = "Agent has been rejected"
    redirect_to admin_dashboard_index_path
  end
end