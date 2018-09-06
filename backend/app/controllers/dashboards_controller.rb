class DashboardsController < ApplicationController
  before_action :require_login
  # GET /dashboards
  def index
    @user = User.find(current_user.id)
    if @user.hunter_profile
      @listings = find_hunter_matches(
        @user.hunter_profile.id)
    end
  end
end
