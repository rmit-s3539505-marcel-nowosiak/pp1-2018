class DashboardsController < ApplicationController
  # GET /dashboards
  def index
    @user = find_user(:session[:user_id])
    @profile = find_hunter_profile(@user.id) if not @user.nil?
  end
end
