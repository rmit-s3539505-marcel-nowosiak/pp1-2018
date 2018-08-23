class DashboardsController < ApplicationController
  # GET /dashboards
  def index
    # @user = nil
    # @profile = nil
    @user = find_user(:session[:user_id])
    @profile = find_hunter_profile(@user.id) unless @user.nil?
  end
end
