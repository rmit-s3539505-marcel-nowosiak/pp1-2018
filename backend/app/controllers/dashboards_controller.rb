class DashboardsController < ApplicationController
  # GET /dashboards
  def index
    # @user = nil
    # @profile = nil
    @user = find_user(1)
    # @profile = find_hunter_profile(@user.id) unless @user.nil?
  end
end
