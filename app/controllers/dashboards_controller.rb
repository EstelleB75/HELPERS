class DashboardsController < ApplicationController
  def profile
    authorize(:dashboard, :profile?)
    @assos = current_user.assos

    @markers = @assos.geocoded.map do |asso|
      {
        lat: asso.latitude,
        lng: asso.longitude
      }
    end
  end
end
