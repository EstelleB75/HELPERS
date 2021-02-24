class DashboardsController < ApplicationController
  def profile
    authorize(:dashboard, :profile?)
  end
end
