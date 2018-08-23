class DashboardsController < ApplicationController
  before_action :require_login
  # GET /dashboards
  def index
    @user = find_user(current_user.id)
    @profile = find_hunter_profile(@user.id) unless @user.nil?
  end
end
